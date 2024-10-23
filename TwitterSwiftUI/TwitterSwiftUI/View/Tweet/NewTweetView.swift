//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 23.10.2024.
//

import SwiftUI

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                    TextArea("What's happening?", text: $captionText)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(
                    leading:
                        Button(action: {
                            isPresented.toggle()
                        }, label: {
                            Text("Cencel")
                                .foregroundStyle(.blue)
                        }),
                    trailing:
                        Button(action: {
                            
                        }, label: {
                            Text("Tweet")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        }))
                
                Spacer()
            }
        }
    }
}

#Preview {
    NewTweetView(isPresented: .constant(true))
}
