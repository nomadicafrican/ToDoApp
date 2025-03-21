import SwiftUI

//Launch screen for the ToDo App
struct LaunchScreen: View {
    var body: some View {
        VStack {
            Text("ToDo App")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Created by Yours Truly")
                .font(.subheadline)
                .foregroundColor(.gray)
        }

        // Expands to fill available space
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
}

// Preview struct for SwiftUI canvas
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()

    }

}

