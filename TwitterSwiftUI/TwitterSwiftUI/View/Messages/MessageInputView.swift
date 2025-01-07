//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button {
                action()
            } label: {
                Text("Send")
            }

        }
    }
}
