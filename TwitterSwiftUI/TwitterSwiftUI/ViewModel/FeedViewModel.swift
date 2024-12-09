//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 09.12.2024.
//

import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { spanshot, error in
            
            if let error = error {
                        print("DEBUG: Error fetching tweets: \(error.localizedDescription)")
                        return
                    }
            
            guard let document = spanshot?.documents else {
                print("DEBUG: No Document Found")
                return
            }
            
            for document in document {
                       print("DEBUG: Raw data for document \(document.documentID): \(document.data())")
                   }
            
            self.tweets = document.compactMap({try? $0.data(as: Tweet.self)})
        }
    }
}
