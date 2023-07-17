//
//  AuthDataResultModel.swift
//  LoveCrane
//
//  Created by Toughie on 2023/07/17.
//

import Foundation
import FirebaseAuth

// MARK: 파이어베이스 로그인 관련 유저의 *uid를 포함한 정보를 포함하는 구조체입니다.

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

// MARK: provider 옵션 값을 관리하는 열거형입니다.(ex. 애플, 구글 등)
enum AuthProviderOption: String {
    case apple = "apple.com"
}
