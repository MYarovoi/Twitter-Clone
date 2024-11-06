//
//  SecureTextField.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 24.10.2024.
//

import SwiftUI

struct SecureTextField: View {
    @Binding var text: String
    let placeholder: String
    let imageName: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
            
            SecureField("", text: $text, prompt: Text(placeholder).foregroundStyle(.white))
                
        }
    }
}

#Preview {
    SecureTextField(text: .constant(""), placeholder: "Password", imageName: "lock")
}
