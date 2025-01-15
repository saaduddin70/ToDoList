//
//  ProfileView.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/29/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text((Date(timeIntervalSince1970: user.joined)
                    .formatted(date: .abbreviated, time: .shortened)))
            }
            .padding()
        }.padding()
        
//        Button("Log Out") {
//            viewModel.logOut()
//        }
//        .background(.blue)
//        .tint(.red)
//        .padding()
        Button(action: {
             viewModel.logOut()
         }) {
             Text("Log Out")
                 .font(.system(size: 18))
                 .foregroundColor(.white)
                 .frame(maxWidth: .infinity, minHeight: 44)
                 .background(Color.red)
                 .cornerRadius(8)
                 .padding(.horizontal)
         }
        Spacer()
    }
}

#Preview {
    ProfileView()
}
