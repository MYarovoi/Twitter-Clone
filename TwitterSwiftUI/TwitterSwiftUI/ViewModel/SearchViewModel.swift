//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.11.2024.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let document = snapshot?.documents else { return }
            self.users = document.compactMap({try? $0.data(as: User.self)})
        }
    }
}
