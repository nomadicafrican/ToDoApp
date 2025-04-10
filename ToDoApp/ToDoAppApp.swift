//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Authors:
//    Ammar Ali, Student ID: 101388320
//    Ahmed Gabeyre, Student ID: 101446744
//    Sara Eisazadeh, Student ID: 101432538
//
//  Description:
//  The main entry point of the application.
//  It launches the ContentView/LaunchScreen upon app start.
 
import SwiftUI

@main
struct ToDoAppApp: App {
    /// Controls whether the splash (launch) screen is displayed.
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                LaunchScreen()
                    .onAppear {
                        // Delay of 2 seconds before transitioning to the main content.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}


