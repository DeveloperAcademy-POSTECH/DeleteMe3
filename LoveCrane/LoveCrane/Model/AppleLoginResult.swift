//
//  AppleLoginResult.swift
//  LoveCrane
//
//  Created by Toughie on 2023/07/17.
//

import Foundation

//MARK: 애플 로그인 플로우 완료 시 반환값을 관리하기 위한 구조체입니다.(OAuthProvider를 통해 credential을 만들 데이터)
struct AppleLoginResult {
    let token: String
    let nonce: String
    let userName: String?
    let email: String?
}
