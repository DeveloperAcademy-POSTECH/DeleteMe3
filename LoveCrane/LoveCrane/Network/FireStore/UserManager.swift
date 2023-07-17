//
//  FirebaseNetwork.swift
//  LoveCrane
//
//  Created by 235 on 2023/07/14.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
final class UserManager {
    static let shared = UserManager()

    func createNewUser(user: Info) async throws{
        let userData: [String:Any] = [
            "uuid" : user.uuid,
            "nickname" : user.nickname,
            "partner_id" : user.partnerId,
            "my_code" : user.mycode
        ]
        try await Firestore.firestore()
            .collection("Users")
            .document(user.uuid)
            .setData(userData,merge: false)
    }

}
