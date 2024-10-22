//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 18.10.2024.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(spacing: 14) {
                ForEach (0 ..< 2) { _ in
                    UserCell()
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
