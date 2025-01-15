//
//  ToDoListViewViewModel.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/29/24.
//
import FirebaseFirestore
import Foundation

// ViewModel for list of items
// Primary tab

class  ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId : String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    
    
}
