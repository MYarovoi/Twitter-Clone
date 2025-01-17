//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 19.11.2024.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Codable {
    let id: String
    let username: String
//    let profileImageUrl: String
    let fullName: String
    let email: String
    var stats: UserStats?
    var isFollowed = false
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

struct UserStats: Codable {
    let followers: Int
    let following: Int
}
