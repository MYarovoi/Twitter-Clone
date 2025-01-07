//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 21.10.2024.
//

import SwiftUI

struct ConversationCell: View {
    let message: Message
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.user.fullName)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                    
                    Text(message.text)
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                .foregroundStyle(.black)
                Spacer()
            }
            Divider()
        }
    }
}
