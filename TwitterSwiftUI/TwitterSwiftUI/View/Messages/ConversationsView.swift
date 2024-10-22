//
//  ConversationsView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 21.10.2024.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewmessageView = false
    @State var showChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            NavigationLink(destination: ChatView(), isActive: $showChat) {
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(0 ..< 10) { _ in
                        NavigationLink {
                            ChatView()
                        } label: {
                            ConversationCell()
                        }

                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            
            Button {
                self.isShowingNewmessageView.toggle()
            } label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundStyle(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewmessageView) {
                NewMessageView(show: $isShowingNewmessageView, startChat: $showChat)
            }
        }
    }
}

#Preview {
    ConversationsView()
}
