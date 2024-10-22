//
//  ConversationsView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 21.10.2024.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
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
                    self.isShowingNewMessageView.toggle()
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
                .sheet(isPresented: $isShowingNewMessageView) {
                    NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
                }
            }
            .navigationDestination(isPresented: $showChat) {
                ChatView()
            }
        }
    }
}


#Preview {
    ConversationsView()
}
