//
//  TweetCell.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("@Batman ·")
                            .foregroundStyle(.gray)
                        
                        Text("2w")
                            .foregroundStyle(.gray)
                    }
                    Text("It's not who I am underneath, it's what I do that defines me.")
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                }
                
                Spacer()

                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                }
            }
            .padding(.horizontal)
            .foregroundStyle(.gray)
            
            Divider()
        }
        .padding(.leading, -12)
    }
}

#Preview {
    TweetCell()
}
