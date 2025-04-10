//
//  TaskDetailView.swift
//  ToDoApp
//
//  Authors:
//    Ammar Ali, Student ID: 101388320
//    Ahmed Gabeyre, Student ID: 101446744
//    Sara Eisazadeh, Student ID: 101432538
//
//  Description:
//  Displays detailed information about a single task and allows the user to
//  mark the task as completed or pending. Updates are immediately reflected in the data store.
 
import SwiftUI

struct TaskDetailView: View {
    var task: Task
    /// Observed data store to update task changes.
    @ObservedObject var dataStore: TaskDataStore
    
    /// Temporary state to control the completion toggle.
    @State private var isCompleted: Bool
    
    // Custom initializer to set the initial toggle state.
    init(task: Task, dataStore: TaskDataStore) {
        self.task = task
        self.dataStore = dataStore
        _isCompleted = State(initialValue: task.isCompleted)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(task.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Due: \(task.dueDate.formatted(date: .abbreviated, time: .shortened))")
                .font(.headline)
            
            // Toggle to mark the task as completed or pending.
            Toggle(isOn: $isCompleted) {
                Text(isCompleted ? "✅ Completed" : "⚠️ Pending")
                    .foregroundColor(isCompleted ? .green : .red)
            }
            .onChange(of: isCompleted) { newValue in
                // Update the task in the data store when toggled.
                var updatedTask = task
                updatedTask.isCompleted = newValue
                dataStore.updateTask(updatedTask)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Task Details")
    }
}

// MARK: - Preview
struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let store = TaskDataStore()
        let sampleTask = Task(title: "Sample Task", dueDate: Date(), isCompleted: false)
        return TaskDetailView(task: sampleTask, dataStore: store)
    }
}

