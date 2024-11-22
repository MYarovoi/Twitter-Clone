//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                    .padding()
                
                ForEach(0..<9) { tweet in
                    TweetCell()
                        .padding(.horizontal, 36)
                }
            }
            .navigationTitle("@batman")
        }
    }
}

//#Preview {
//    UserProfileView()
//}
