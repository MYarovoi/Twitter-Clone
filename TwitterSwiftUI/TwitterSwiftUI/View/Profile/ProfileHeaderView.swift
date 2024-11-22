//
//  ProfileHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI
//import Kingfisher

struct ProfileHeaderView: View {
    @State var selectedFilter: TweetFilterOptions = .tweets
    let user: User
    
    var body: some View {
        VStack {
            Image("batman")
//            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
            
            Text(user.fullName)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text("Billionaire by day, dark by night")
                .font(.system(size: 14))
                .padding(.top, 8)
                
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
                
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }
            .padding()
            
            ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
            
            FilterButtonView(selectedOption: $selectedFilter)
                .padding()
            
            Spacer()
        }
    }
}

//#Preview {
//    ProfileHeaderView()
//}
