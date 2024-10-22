//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                ConversationsView()
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
