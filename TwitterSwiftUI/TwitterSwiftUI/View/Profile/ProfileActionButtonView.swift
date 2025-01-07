//
//  ProfileActionButtonView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button {
                
            } label: {
                Text("Addit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(20)
            }
        } else {
            HStack {
                Button {
                    viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(viewModel.user.isFollowed ? "Following" : "Follow")
                }
                .frame(width: 180, height: 40)
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(20)
                
                NavigationLink(destination: ChatView(user: viewModel.user)) {
                        Text("Message")
                            .frame(width: 180, height: 40)
                            .background(Color.purple)
                            .foregroundStyle(.white)
                }
                .cornerRadius(20)
            }
        }
    }
}
