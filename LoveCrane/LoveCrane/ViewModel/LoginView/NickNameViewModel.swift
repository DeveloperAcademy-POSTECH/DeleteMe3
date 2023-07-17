//
//  NickNameViewModel.swift
//  LoveCrane
//
//  Created by 235 on 2023/07/17.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
class NickNameViewModel: ObservableObject {
    @Published var nickname: String = ""
    func addmemeber() async throws {
        let randommycode = String.createRandomStr(length: 10)
        let uuid = String.createRandomStr(length: 13)
        let infodata = Info(mycode: randommycode, nickname: nickname, partnerId: "", uuid: uuid)
        try await UserManager.shared.createNewUser(user: infodata)
    }
}
