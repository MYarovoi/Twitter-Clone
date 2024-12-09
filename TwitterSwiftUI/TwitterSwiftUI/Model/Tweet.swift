//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 09.12.2024.
//

import Foundation
import Firebase

struct Tweet: Identifiable, Codable {
    let id: String
    let caption: String
    let fullname: String
    let likes: Int
    let timeStamp: Timestamp
    let uid: String
    let username: String
    //    let profileImageUrl: String
}
