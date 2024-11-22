//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Mykyta Yarovoi on 14.11.2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating: Bool = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error logIn user: \(error.localizedDescription)")
                return
                
                self.userSession = result?.user
            }
        }
    }
    
    func registerUser(email: String, password: String, username: String,
                      fullName: String) {
        
        //        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        //        let filename = UUID().uuidString
        //        let storageRef = Storage.storage().reference().child(filename)
        //
        //        storageRef.putData(imageData, metadata: nil) { _, error in
        //            if let error = error {
        //                print("DEBUG: Error uploading image: \(error.localizedDescription)")
        //                return
        //            }
        //
        //            print("DEBUG: Image uploaded successfully")
        //
        //            storageRef.downloadURL { url, _ in
        //                guard let profileImageURL = url?.absoluteString else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error creating user: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullName": fullName,
                        //                                "profileImageURL": profileImageURL,
                        "id": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.userSession = user
            }
        }
    }
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            do {
                guard let user = try snapshot?.data(as: User.self) else { return }
                print("DEBUG: User is \(user.username)")
                
            } catch {
                print("DEBUG: Error fetching user: \(error.localizedDescription)")
            }
        }
    }
}

//    }
//}

