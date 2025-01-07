//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding var selectedIndex: Int
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationStack{
                    TabView(selection: $selectedIndex) {
                        FeedView()
                            .onTapGesture {
                                selectedIndex = 0
                            }
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }.tag(0)
                        
                        SearchView()
                            .onTapGesture {
                                selectedIndex = 1
                            }
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }.tag(1)
                        
                        ConversationsView()
                            .onTapGesture {
                                selectedIndex = 2
                            }
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }.tag(2)
                    }
                    .navigationTitle("Home")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                viewModel.signOut()
                            } label: {
                                Image(systemName: "rectangle.portrait.and.arrow.forward")
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(width: 28, height: 28)
                                    .padding(.leading)
                            }

                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
            }
        }

    }
}

#Preview {
    ContentView()
}
