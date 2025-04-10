//
//  AddTaskView.swift
//  ToDoApp
//
//  Authors:
//    Ammar Ali, Student ID: 101388320
//    Ahmed Gabeyre, Student ID: 101446744
//    Sara Eisazadeh, Student ID: 101432538
//
//  Description:
//  Provides a form for the user to add a new task, allowing input for the task title and due date.
//  Newly created tasks are added to the TaskDataStore.
 
import SwiftUI

struct AddTaskView: View {
    /// Environment variable to dismiss the view.
    @Environment(\.presentationMode) var presentationMode
    
    /// Reference to the shared TaskDataStore.
    @ObservedObject var dataStore: TaskDataStore
    
    // Local state for the new task details.
    @State private var title: String = ""
    @State private var dueDate: Date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Info")) {
                    TextField("Task Title", text: $title)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
            }
            .navigationTitle("Add New Task")
            .toolbar {
                // Cancel button to dismiss without saving.
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                // Save button to add the new task.
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveTask()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
    
    /// Creates a new Task, adds it to the datastore, and dismisses the view.
    private func saveTask() {
        let newTask = Task(title: title, dueDate: dueDate, isCompleted: false)
        dataStore.addTask(newTask)
        presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - Preview
struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(dataStore: TaskDataStore())
    }
}

