import SkipFuseUI

struct RootView: View {
   
    @Environment(NavagationController.self) var navagationController

    var body: some View {
            ZStack {
                if navagationController.isHomeActive {
                    HomeView()
                } else {
                    LoginScreen()
                }
            }
        }   
}
