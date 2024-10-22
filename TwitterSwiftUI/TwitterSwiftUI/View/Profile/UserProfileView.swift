//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 22.10.2024.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(0..<9) { tweet in
                    TweetCell()
                        .padding(.horizontal, 26)
                }
            }
            .navigationTitle("@batman")
        }
    }
}

#Preview {
    UserProfileView()
}
