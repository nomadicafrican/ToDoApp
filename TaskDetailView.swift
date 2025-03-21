import SwiftUI
// This view displays detailed information about a single Task

struct TaskDetailView: View {
    var task: Task

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(task.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Due: \(task.dueDate.formatted(date: .abbreviated, time: .shortened))")
                .font(.headline)
            
            if task.isCompleted {
                Text("✅ Completed")
                    .foregroundColor(.green)
            } else {
                Text("⚠️ Pending")
                    .foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Task Details")
    }
}

// // Preview for SwiftUI Canvas / Xcode Previews

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(title: "Sample Task", dueDate: Date(), isCompleted: false))
    }
}

