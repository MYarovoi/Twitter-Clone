//
//  MessageView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.leading, 100)
                    .padding(.trailing, 16)
                
            } else {
                HStack(alignment: .bottom) {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundStyle(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 100)
                .padding(.leading, 16)
            }
        }
    }
}
