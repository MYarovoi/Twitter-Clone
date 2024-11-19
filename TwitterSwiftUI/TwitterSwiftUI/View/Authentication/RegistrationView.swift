//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 24.10.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State var fullName: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage() {
        guard let selectedUIImage = selectedUIImage else { return }
        image = Image(uiImage: selectedUIImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    showImagePicker.toggle()
                } label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .clipShape(Circle())
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                        } else {
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                                .foregroundStyle(.white)
                        }
                    }
                }.sheet(isPresented: $showImagePicker) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedUIImage)
                }

                
                VStack(spacing: 20) {
                    CustomTextField(text: $fullName, placeholder: "Full Name", imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                    
                    CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                    
                    CustomTextField(text: $username, placeholder: "Username", imageName: "pencil")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                    
                    SecureTextField(text: $password, placeholder: "Password", imageName: "lock")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 32)
                
                Button {
//                    guard let image = selectedUIImage else { return }
                    
                    viewModel.registerUser(email: email, password: password, username: username, fullName: fullName)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14,weight: .semibold))
                    }
                    .foregroundStyle(.white)
                    .padding(.bottom, 40)
                }

            }
        }
        .background(Color(red: 47 / 255, green: 161 / 255, blue: 243 / 255))
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
