//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0 ..< 10) { _ in
                        TweetCell()
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            
            Button {
                
            } label: {
                Image("Tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundStyle(.white)
            .clipShape(Circle())
            .padding()
        }
    }
}

#Preview {
    FeedView()
}
