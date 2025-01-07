//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct ChatView: View {
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    
    init (user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    @State var messageText: String = ""
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                    }
                }
            }
            .padding(.top)
            
            MessageInputView(messageText: $messageText, action: {
                if messageText != "" {
                    viewModel.sendMesssages(messageText)
                }
                messageText = ""
            })
                .padding()
        }
        .navigationTitle(user.username)
    }
}
