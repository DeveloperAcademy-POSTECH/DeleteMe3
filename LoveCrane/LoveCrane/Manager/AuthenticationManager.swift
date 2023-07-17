//
//  AuthenticationManager.swift
//  LoveCrane
//
//  Created by Toughie on 2023/07/17.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    
    // 앱 전반에서 인증 관련 작업을 처리할 것이기 때문에 싱글톤 패턴을 적용.(일관성 유지 및 효율성을 위해)
    static let shared = AuthenticationManager()
    private init() { }
    
    // MARK: credential을 통한 파이어베이스 로그인
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
    // MARK: 현재 로그인된 유저의 정보를 가져오는 메서드 (로컬)
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw AuthErrors.failedToGetAuthenticatedCurrentUser
        }
        return AuthDataResultModel(user: user)
    }
    // MARK: 로그아웃
    func signOut() throws {
        try Auth.auth().signOut()
    }
    // MARK: 서버에서 유저를 삭제 (회원 탈퇴)
    func deleteUser() async throws {
        guard let user = Auth.auth().currentUser else {
            throw AuthErrors.failedToGetAuthenticatedCurrentUser
        }
        try await user.delete()
    }
}

extension AuthenticationManager {
    // MARK: 애플 로그인 
    @discardableResult
    func signInWithApple(tokens: AppleLoginResult) async throws -> AuthDataResultModel {
        let credential = OAuthProvider.credential(withProviderID: AuthProviderOption.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce)
        return try await signIn(credential: credential)
    }
}
