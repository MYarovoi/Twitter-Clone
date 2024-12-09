//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding()
                
                ForEach(0..<9) { tweet in
//                    TweetCell()
//                        .padding(.horizontal, 36)
                }
            }
            .navigationTitle("@batman")
        }
    }
}

//#Preview {
//    UserProfileView()
//}
