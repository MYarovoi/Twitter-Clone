//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 09.12.2024.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    @Binding var isPressented: Bool
    
    init(isPressented: Binding<Bool>) {
        self._isPressented = isPressented
    }
    
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["id": docRef.documentID,
                                   "caption": caption,
                                   "fullname": user.fullName,
                                   "likes": 0,
                                   "timeStamp": Timestamp(date: Date()),
                                   "uid": user.id,
                                   "username": user.username
//                                   "profileImageURL": user.profileImageURL,
                                   ]
        
        docRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded tweet..")
            self.isPressented = false
        }
    }
}
