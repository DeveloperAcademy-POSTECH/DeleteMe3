//
//  AuthErrors.swift
//  LoveCrane
//
//  Created by Toughie on 2023/07/17.
//

import Foundation

enum AuthErrors: Error {
    case failedToGetAuthenticatedCurrentUser
    case failedToGetTopViewController
    case failedToMakeAppleIDCredential
}
