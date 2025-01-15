//
//  RegisterView.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/29/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
            
            Form{
                TextField("Full name" ,text:$viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                
                // ekhon kisu modifier add korbo
                TextField("Email Address" ,text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password" ,text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                TLButton(
                    title: "Create account",
                         background: .green
                ) {
                    viewModel.register()
                    // Attempt to register
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
