//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.11.2024.
//

import SwiftUI
import Firebase

enum SearchViewModelConfiguration {
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private let config: SearchViewModelConfiguration
    
    init(config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers(forConfig: config)
    }
    
    func fetchUsers(forConfig config: SearchViewModelConfiguration) {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let document = snapshot?.documents else { return }
            let users = document.compactMap({try? $0.data(as: User.self)})
            
            switch config {
            case .newMessage:
                self.users = users.filter({ !$0.isCurrentUser})
            case .search:
                self.users = users
            }
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullName.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery)})
    }
}
