//
//  LaunchScreen.swift
//  ToDoApp
//
//  Authors:
//    Ammar Ali, Student ID: 101388320
//    Ahmed Gabeyre, Student ID: 101446744
//    Sara Eisazadeh, Student ID: 101432538
//
//  Description:
//  A simple launch screen displaying the app name and team member names.
 
import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ToDo App")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Created by:")
                .font(.title3)
                .foregroundColor(.gray)
            // Display team member names.
            Text("Ammar Ali (101388320)")
                .font(.title3)
                .foregroundColor(.gray)
            Text("Ahmed Gabeyre (101446744)")
                .font(.title3)
                .foregroundColor(.gray)
            Text("Sara Eisazadeh (101432538)")
                .font(.title3)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

// MARK: - Preview
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

