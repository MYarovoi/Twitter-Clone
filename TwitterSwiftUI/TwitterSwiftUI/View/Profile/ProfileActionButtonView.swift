//
//  ProfileActionButtonView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct ProfileActionButtonView: View {
    let isCurrentUser: Bool
    
    var body: some View {
        if isCurrentUser {
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
                    
                } label: {
                    Text("Followong")
                }
                .frame(width: 180, height: 40)
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(20)
                
                Button {
                    
                } label: {
                    Text("Message")
                }
                .frame(width: 180, height: 40)
                .background(Color.purple)
                .foregroundStyle(.white)
                .cornerRadius(20)
            }
        }
    }
}

#Preview {
    ProfileActionButtonView(isCurrentUser: true)
}
