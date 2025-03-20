import SwiftUI

// Task Model
struct Task: Identifiable {
    var id = UUID()
    var title: String
    var dueDate: Date
    var isCompleted: Bool
}



