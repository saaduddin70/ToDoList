//
//  DailyTasksView.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/31/24.
//

import SwiftUI

struct DailyTasksView: View {
    @State private var tasks: [DailyTask] = []
    @StateObject var viewModel = DailyTasksViewModel()
    let addToFirebase: (String, Date) -> Void

    var body: some View {
        NavigationView {
            List(tasks, id: \.id) { task in
                HStack {
                    Text(task.name)
                    Spacer()
                    Button(action: {
                        if let taskDate = parseTime(task.time) {
                            let itemViewModel = NewItemViewViewModel()
                            itemViewModel.title = task.name
                            itemViewModel.dueDate = taskDate
                            itemViewModel.save() // Calls the save function in NewItemViewViewModel
                        } else {
                            print("Failed to parse time: \(task.time)")
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Daily Tasks")
            .onAppear {
                viewModel.loadTasks { loadedTasks in
                    tasks = loadedTasks
                }
            }
        }
    }

    // Helper function to parse time string into a Date object
    private func parseTime(_ time: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        if let timeOnlyDate = dateFormatter.date(from: time) {
            var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
            let timeComponents = Calendar.current.dateComponents([.hour, .minute], from: timeOnlyDate)
            components.hour = timeComponents.hour
            components.minute = timeComponents.minute
            return Calendar.current.date(from: components)
        }
        return nil
    }
}

struct DailyTask: Identifiable, Codable {
    let id: String
    let name: String
    let time: String
}
