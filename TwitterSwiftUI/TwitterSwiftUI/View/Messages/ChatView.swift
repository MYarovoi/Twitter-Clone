//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        MessageView(message: message)
                    }
                }
            }
            .padding(.top)
            
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

#Preview {
    ChatView()
}
