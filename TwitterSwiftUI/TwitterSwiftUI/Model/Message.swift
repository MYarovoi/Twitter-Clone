//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "Hello, man", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "Hi", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "How are you?", isCurrentUser: true),
    .init(id: 3, imageName: "spiderman", messageText: "Not bad, u?", isCurrentUser: false),
    .init(id: 4, imageName: "batman", messageText: "Nothing new", isCurrentUser: true),
    .init(id: 5, imageName: "spiderman", messageText: "See you later, aligator", isCurrentUser: false)
]
