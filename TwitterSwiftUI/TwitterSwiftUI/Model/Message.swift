//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth

struct Message: Identifiable, Codable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId}
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromID"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}

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
