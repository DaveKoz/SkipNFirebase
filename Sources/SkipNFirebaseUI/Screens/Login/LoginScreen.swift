import SkipFuseUI


struct LoginScreen: View {
    
    @State var navigateToEmailEntry = false
    @Environment(NavagationController.self) var navagationController
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .padding()
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.5), value: true)
                
                Spacer()
                
                Button(action: {
                    navigateToEmailEntry = true
                }) {
                    Label("Continue with Email", systemImage: "envelope")
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .navigationDestination(isPresented: $navigateToEmailEntry) {
                    EmailEntryScreen()
                }
              
                
                Button(action: {
                    continueAsGuest()
                }) {
                    Label("Continue as Guest", systemImage: "person.fill")
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
                }
                
                Spacer()
               
            }
            .padding()
            //.navigationTitle("Sign In") // If you want
        }
    }

    private func continueAsGuest() {
        print("Continue as Guest tapped")
        navagationController.isHomeActive = true
    }
        
    private func authenticateWithEmail() {
        print("Authenticate with Email tapped")
        // Add email authentication logic
        navagationController.isHomeActive = true
    }

}

