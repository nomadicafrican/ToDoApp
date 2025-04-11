//
//  Task.swift
//  ToDoApp
//
//  Authors:
//    Ammar Ali, Student ID: 101388320
//    Ahmed Gabeyre, Student ID: 101446744
//    Sara Eisazadeh, Student ID: 101432538
//
//  Description:
//  This file defines the Task model used throughout the application.
//  The model is Codable to support easy reading and writing to persistent storage.
 

import Foundation

/// A model representing a single to-do Task.
struct Task: Identifiable, Codable {
    /// Unique identifier for each task.
    var id = UUID()
    
    /// Title of the task.
    var title: String
    
    /// Due date for the task.
    var dueDate: Date
    
    /// A flag indicating whether the task is completed or not.
    var isCompleted: Bool
    
    /// A computed property to check if the task is overdue or ontime.
    var isOverdue: Bool {
        !isCompleted && dueDate < Date()
    }
}

