//
//  LoginView.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/29/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .red)
                
                
                // Login Form
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address" ,text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password" ,text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "log in", background: .blue){
                        // Attempt to log in
                        viewModel.login()
                    }
                    
                }
                .offset(y: -50)
                // Create Account
                
                VStack{
                    Text("New Around Here")
                    NavigationLink("Create An account",
                                   destination: RegisterView() )
                    
                }
                .padding(.bottom,50)
                
                Spacer()
                
                
            }
        }
    }
}


#Preview {
    LoginView()
}
