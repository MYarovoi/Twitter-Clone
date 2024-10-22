//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button {
                
            } label: {
                Text("Send")
            }

        }
    }
}

#Preview {
    MessageInputView(messageText: .constant("message"))
}
