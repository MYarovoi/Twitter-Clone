//
//  NewMessageView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText: String = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    @Binding var user: User?
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(spacing: 14) {
                ForEach (searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    Button {
                        self.show.toggle()
                        self.startChat.toggle()
                        self.user = user
                    } label: {
                        UserCell(user: user)
                    }

                }
            }
        }
    }
}
