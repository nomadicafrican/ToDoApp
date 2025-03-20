import SwiftUI

// Task Model
struct Task: Identifiable {
    var id = UUID()
    var title: String
    var dueDate: Date
    var isCompleted: Bool
}

// Main View
struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(title: "Finish Swift assignment", dueDate: Date().addingTimeInterval(86400), isCompleted: false),
        Task(title: "Go to gym", dueDate: Date().addingTimeInterval(3600), isCompleted: false),
        Task(title: "Buy groceries", dueDate: Date().addingTimeInterval(7200), isCompleted: true)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    TaskRow(task: task)
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}


