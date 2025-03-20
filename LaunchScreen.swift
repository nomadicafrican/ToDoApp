import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        VStack {
            Text("ToDo App")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Created by Your Name")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

// Preview
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
        
    }
}

