//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
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
                    .foregroundStyle(.black)
                
                Text("Bruce Wayne")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
