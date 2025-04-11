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

// View to display task details and update its completion status
struct TaskDetailView: View {
    /// The task object being displayed and edited
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
            // Displays task title with styling
            Text(task.title)
                .font(.title)
                .fontWeight(.bold)
            
            // Displays formatted due date
            Text("Due: \(task.dueDate.formatted(date: .abbreviated, time: .shortened))")
                .font(.headline)
            
            // Toggle to mark the task as completed or pending.
            Toggle(isOn: $isCompleted) {
                Text(isCompleted ? "✅ Completed" : "⚠️ Pending")
                    .foregroundColor(isCompleted ? .green : .red)
            }
            // Listen to toggle changes and update the task in the data store
            .onChange(of: isCompleted) { newValue in
                // Update the task in the data store when toggled.
                var updatedTask = task
                updatedTask.isCompleted = newValue
                dataStore.updateTask(updatedTask)
            }
            
            Spacer()
        }
        // Add padding and title to the view
        .padding()
        .navigationTitle("Task Details")
    }
}

// MARK: - Preview for SwiftUI Canvas with a sample task and data store
struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let store = TaskDataStore()
        let sampleTask = Task(title: "Sample Task", dueDate: Date(), isCompleted: false)
        return TaskDetailView(task: sampleTask, dataStore: store)
    }
}

