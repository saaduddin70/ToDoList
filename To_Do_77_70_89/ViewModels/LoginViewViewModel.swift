//
//  LoginViewViewModel.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/29/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        // deafault constructor banaisi
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate()-> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in all fields"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            
            return false
        }
        
        return true
    }
    
    
}
