//
//  TaskRow.swift
//  ToDoApp
//
//  Authors:
//    Ammar Ali, Student ID: 101388320
//    Ahmed Gabeyre, Student ID: 101446744
//    Sara Eisazadeh, Student ID: 101432538
//
//  Description:
//  A view that displays brief details for a single task in the list.
 
import SwiftUI

// View that displays a summarized row for a single task
struct TaskRow: View {
    /// Task to be displayed in the row
    var task: Task
    
    var body: some View {
        HStack {
            // Displays task title and due date with styling
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                
                Text("Due: \(task.dueDate.formatted(date: .abbreviated, time: .shortened))")
                    .font(.subheadline)
                    .foregroundColor(task.isCompleted ? .green : (task.isOverdue ? .red : .orange))
            }
            // Pushes status icon to the far right
            Spacer()
            
            // Visual indicator based on task status.
            if task.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            } else if task.isOverdue {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundColor(.red)
            } else {
                Image(systemName: "exclamationmark.circle")
                    .foregroundColor(.orange)
            }
        }
        // Adds vertical spacing for visual clarity
        .padding(.vertical, 5)
    }
}

// MARK: - Preview for SwiftUI Canvas with a sample overdue task
struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: Task(title: "Sample Task", dueDate: Date().addingTimeInterval(-3600), isCompleted: false))
    }
}

