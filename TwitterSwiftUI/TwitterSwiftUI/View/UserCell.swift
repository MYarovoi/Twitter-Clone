//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI
//import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
//            KFImage(URL(string: user.profileImageUrl))
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Text(user.fullName)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    UserCell()
//}
