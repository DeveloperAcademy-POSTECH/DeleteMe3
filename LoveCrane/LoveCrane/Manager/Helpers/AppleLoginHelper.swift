//
//  AppleLoginHelper.swift
//  LoveCrane
//
//  Created by Toughie on 2023/07/17.
//

import SwiftUI
import AuthenticationServices
import CryptoKit

@MainActor
final class AppleLoginHelper: NSObject {
    
    private var currentNonce: String?
    
    private var completionHandler: ((Result<AppleLoginResult, Error>) -> Void)? = nil
    
    // MARK: 애플 로그인 플로우 시작
    func startSignInWithAppleFlow(completion: @escaping (Result<AppleLoginResult, Error>) -> Void) {
        
        guard let topVC = TopViewControllerManager.shared.topViewController() else {
            completion(.failure(AuthErrors.failedToGetTopViewController))
            return
        }
        
      let nonce = randomNonceString()
      currentNonce = nonce
        
      completionHandler = completion
        
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = topVC
      authorizationController.performRequests()
    }
    
    // MARK: Nonce 난수 문자열
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            preconditionFailure(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            charset[Int(byte) % charset.count]
        }
        return String(nonce)
    }

    // MARK: nonce 해시화
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}

// MARK: ASAuthorizationControllerDelegate
extension AppleLoginHelper: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        guard
            let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
            let appleIDToken = appleIDCredential.identityToken,
            let idTokenString = String(data: appleIDToken, encoding: .utf8),
            let nonce = currentNonce else {
            completionHandler?(.failure(AuthErrors.failedToMakeAppleIDCredential))
            return
        }
        
        let userName = appleIDCredential.fullName?.givenName
        let email = appleIDCredential.email
        
        let tokens = AppleLoginResult(token: idTokenString, nonce: nonce, userName: userName, email: email)
        completionHandler?(.success(tokens))
    }

  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
      print("애플 로그인 에러 발생: \(error.localizedDescription)")
  }
}

//MARK: ASAuthorizationControllerPresentationContextProviding
extension UIViewController: ASAuthorizationControllerPresentationContextProviding {
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let window = self.view.window else {
            preconditionFailure("Unable to access view's window.")
        }
        return window
    }
}
