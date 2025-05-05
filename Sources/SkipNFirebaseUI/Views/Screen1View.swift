import SkipFuseUI

struct Screen1View: View {
    
    @Environment(NavagationController.self) var navagationController
    
    var body: some View {
        VStack {
            Text("Screen 1")
                .font(.largeTitle)
                .padding()
            Spacer()
            Text("Hello - " + navagationController.LogedInUser)
                .font(.headline)
                .padding()
            Spacer()
        }
    }
}

