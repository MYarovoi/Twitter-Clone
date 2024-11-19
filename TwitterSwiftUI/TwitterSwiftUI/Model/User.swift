//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 19.11.2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
//    let profileImageUrl: String
    let fullName: String
    let email: String
}
