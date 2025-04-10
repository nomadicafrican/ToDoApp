//
//  ContentView.swift
//  ToDoApp
//
//  Authors:
//    Ammar Ali, Student ID: 101388320
//    Ahmed Gabeyre, Student ID: 101446744
//    Sara Eisazadeh, Student ID: 101432538
//
//  Description:
//  The main view displaying a list of tasks. It includes navigation to the task detail
//  page and provides a sheet to add new tasks.
 
import SwiftUI

struct ContentView: View {
    /// Observed TaskDataStore that holds all tasks.
    @StateObject private var dataStore = TaskDataStore()
    
    /// Boolean flag to show the AddTaskView sheet.
    @State private var showingAddTask = false
    
    var body: some View {
        NavigationView {
            List {
                // Looping through each task in the datastore.
                ForEach(dataStore.tasks) { task in
                    NavigationLink(destination: TaskDetailView(task: task, dataStore: dataStore)) {
                        TaskRow(task: task)
                    }
                }
                // Enable swipe-to-delete functionality.
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                // Add button to show the AddTaskView sheet.
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddTask.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // Present the AddTaskView as a modal sheet.
            .sheet(isPresented: $showingAddTask) {
                AddTaskView(dataStore: dataStore)
            }
        }
    }
    
    /// Deletes tasks from the data store.
    /// - Parameter offsets: The set of offsets representing tasks to delete.
    private func deleteTask(offsets: IndexSet) {
        dataStore.removeTasks(atOffsets: offsets)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

