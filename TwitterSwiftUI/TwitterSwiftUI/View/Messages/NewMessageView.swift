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
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(spacing: 14) {
                ForEach (viewModel.users) { user in
                    Button {
                        self.show.toggle()
                        self.startChat.toggle()
                    } label: {
                        UserCell(user: user)
                    }

                }
            }
        }
    }
}

#Preview {
    NewMessageView(show: .constant(true), startChat: .constant(true))
}
