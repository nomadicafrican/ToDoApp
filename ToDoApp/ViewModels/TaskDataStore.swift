//
//  TaskDataStore.swift
//  ToDoApp
//
//  Authors:
//    Ammar Ali, Student ID: 101388320
//    Ahmed Gabeyre, Student ID: 101446744
//    Sara Eisazadeh, Student ID: 101432538
//
//  Description:
//  This file manages persistent data storage for Tasks using UserDefaults.
//  It is responsible for loading, saving, adding, updating, and removing tasks.
//

import Foundation
import SwiftUI

/// An ObservableObject that holds and manages an array of Task items.
/// It handles reading from and writing to persistent storage.
class TaskDataStore: ObservableObject {
    
    /// The key used for saving tasks in UserDefaults.
    private let tasksKey = "SavedTasksKey"
    
    /// The array of tasks that will be displayed and modified by the app.
    @Published var tasks: [Task] = []
    
    /// Initializes the TaskDataStore by loading tasks from persistent storage.
    init() {
        loadTasks()
    }
    
    // MARK: - Public Methods
    
    /// Adds a new task to the list and persists the change.
    /// - Parameter task: The Task object to add.
    func addTask(_ task: Task) {
        tasks.append(task)
        saveTasks()
    }
    
    /// Updates an existing task and persists the change.
    /// - Parameter task: The Task object that was updated.
    func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            saveTasks()
        }
    }
    
    /// Removes tasks from the list based on the provided index set and persists the change.
    /// - Parameter offsets: The index set indicating which tasks to remove.
    func removeTasks(atOffsets offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    // MARK: - Private Methods
    
    /// Loads tasks from persistent storage and assigns them to the tasks array.
    private func loadTasks() {
        let defaults = UserDefaults.standard
        if let savedData = defaults.data(forKey: tasksKey) {
            let decoder = JSONDecoder()
            if let decodedTasks = try? decoder.decode([Task].self, from: savedData) {
                self.tasks = decodedTasks
            }
        }
    }
    
    /// Encodes the tasks array to JSON and writes it to persistent storage.
    private func saveTasks() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: tasksKey)
        }
    }
}

