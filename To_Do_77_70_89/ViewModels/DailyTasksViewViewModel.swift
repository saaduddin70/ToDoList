//
//  DailyTasksViewViewModel.swift
//  To_Do_77_70_89
//
//  Created by Abu Loman Hossain Shuvo on 12/31/24.
//

import Foundation

class DailyTasksViewModel: ObservableObject {
    func loadTasks(completion: @escaping ([DailyTask]) -> Void) {
        guard let url = Bundle.main.url(forResource: "daily_tasks", withExtension: "json") else {
            print("JSON file not found")
            completion([])
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let tasks = try JSONDecoder().decode([DailyTask].self, from: data)
            completion(tasks)
        } catch {
            print("Failed to decode JSON: \(error)")
            completion([])
        }
    }
}
