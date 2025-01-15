//
//  NewItemView.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/29/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    //adding newly
    var prefilledTitle: String
    
    init(newItemPresented: Binding<Bool>, prefilledTitle: String = "") {
            self._newItemPresented = newItemPresented
            self.prefilledTitle = prefilledTitle
            _viewModel = StateObject(wrappedValue: NewItemViewViewModel())
        }
    //upto here
    
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                    .onAppear {
                        if viewModel.title.isEmpty {
                            viewModel.title = prefilledTitle
                        }
                    }
                
                //due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save",
                         background: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                        
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date thst is today or newer"))
            }
        }
    }
    
    
    struct NewItemView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemView(newItemPresented: Binding(get: {
                return true
            }, set: { _ in
                
            }))
        }
    }
}
