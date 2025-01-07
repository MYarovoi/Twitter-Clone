//
//  TweetCell.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    let tweet: Tweet
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
//                KFImage(URL(string: tweet.profileImageURL))
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.black)
                        
                        Text("@\(tweet.username) ·")
                            .foregroundStyle(.gray)
                        
                        Text(tweet.timestampString)
                            .foregroundStyle(.gray)
                    }
                    Text(tweet.caption)
                        .foregroundStyle(.black)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            TweetActionsView(tweet: tweet)
            
            Divider()
        }
        .padding(.leading, -12)
    }
}

//#Preview {
//    TweetCell()
//}
