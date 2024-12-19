//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(spacing: 14) {
                ForEach (searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    NavigationLink {
                        LazyView(UserProfileView(user: user))
                    } label: {
                        UserCell(user: user)
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
