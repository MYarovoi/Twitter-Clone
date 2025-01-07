//
//  ChatViewModel.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 06.01.2025.
//

import SwiftUI
import FirebaseCore

class ChatViewModel: ObservableObject {
    let user: User
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
//        query.order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromId = messageData["fromID"] as? String else { return }
                        
                COLLECTION_USERS.document(fromId).getDocument { snapshot, error in
                    do {
                        guard let user = try snapshot?.data(as: User.self) else { return }
                        self.messages.append(Message(user: user, dictionary: messageData))
                        self.messages.sort(by: {$0.timestamp.dateValue() < $1.timestamp.dateValue()})
                    } catch {
                        print("DEBUG: Error decoding user: \(error)")
                    }
                }
            }
        }
    }
    
    func sendMesssages(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let currenUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivedUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let recivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        
        let messageID = currenUserRef.documentID
        
        let data: [String : Any] = ["text": messageText,
                    "id": messageID,
                    "fromID": currentUid,
                    "toId": user.id,
                    "temestamp": Timestamp(date: Date())]
        
        currenUserRef.setData(data)
        receivedUserRef.document(messageID).setData(data)
        recivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id).setData(data)
    }
}
