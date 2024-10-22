//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 21.10.2024.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("batman")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                    
                    Text("Longer message text to see what happens when I do this...")
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

#Preview {
    ConversationCell()
}
