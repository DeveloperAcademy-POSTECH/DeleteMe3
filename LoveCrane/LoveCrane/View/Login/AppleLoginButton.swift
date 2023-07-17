//
//  AppleLoginButtonRepresentable.swift
//  LoveCrane
//
//  Created by Toughie on 2023/07/17.
//

import SwiftUI
import AuthenticationServices
import CryptoKit

// MARK: UIViewRepresentable을 활용한 애플 로그인 버튼입니다.
// 초기화 시 버튼 타입과 스타일을 정해줄 수 있습니다.
struct SignInWithAppleButtonViewRepresentable: UIViewRepresentable {
    
    let buttonType: ASAuthorizationAppleIDButton.ButtonType
    let buttonStyle: ASAuthorizationAppleIDButton.Style
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton(authorizationButtonType: buttonType, authorizationButtonStyle: buttonStyle)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
