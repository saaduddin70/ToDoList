//
//  ContentView.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/29/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        }
        else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            DailyTasksView { taskName, taskDate in
                let itemViewModel = NewItemViewViewModel()
                itemViewModel.title = taskName
                itemViewModel.dueDate = taskDate
                itemViewModel.save()
                        }
                        .tabItem {
                            Label("Daily Tasks", systemImage: "calendar")
                        }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
//    private func addTaskToFirebase(userId: String, name: String, date: Date) {
//            let db = Firestore.firestore()
//            let taskData: [String: Any] = [
//                "name": name,
//                "date": date
//            ]
//            db.collection("users/\(userId)/todos").addDocument(data: taskData) { error in
//                if let error = error {
//                    print("Error adding task: \(error.localizedDescription)")
//                } else {
//                    print("Task '\(name)' added successfully.")
//                }
//            }
//        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
