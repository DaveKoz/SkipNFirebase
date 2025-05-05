import SkipFuseUI
import LocalModel
import FireplaceModel



struct EmailEntryScreen: View {
    
    @Environment(NavagationController.self) var navagationController
    
    @State var email: String = ""
    @State var password: String = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var error = ""
    @State var isCreateAccount = false
    @State var showHomeView = false
    @State var isPasswordValid = false
    
    
    var body: some View {
        
            ZStack {
                Image("skipingman", bundle: .module)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        TextField("Email", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                        
                        SecureField("Password (min 6 characters)", text: $password)
                            .onChange(of: password) {
                                isPasswordValid = password.count >= 6
                            }
                            .textFieldStyle(.roundedBorder)
                        
                        if isCreateAccount {
                            TextField("First Name", text: $firstName)
                                .textFieldStyle(.roundedBorder)
                            
                            TextField("Last Name", text: $lastName)
                                .textFieldStyle(.roundedBorder)
                            
                            
                            Button(action: handleSignUp) {
                                Text("Create Account")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                        } else {
                            Button(action: handleSignIn) {
                                Text("Log In")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                        }
                        
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            isCreateAccount = !isCreateAccount
                        }) {
                            Text(isCreateAccount ? "Already have an account? Sign in" : "Don't have an account? Create one")
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.5)) // Light white background with transparency
                    .cornerRadius(10)
                    .padding(20) // Padding around the gray background
                    .shadow(radius: 10)
                    .frame(width: 400)
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
            }
        .padding()
        .navigationDestination(isPresented: $showHomeView) {
            HomeView()
        }
    }
    
    
    private func handleSignIn() {
        Task {
            let client = SignInClient()
            client.handleSignIn(email: email, password: password)
            // Add a slight delay to wait for error assignment if needed
            try? await Task.sleep(nanoseconds: 300_000_000) // 0.3 seconds
            if client.error == nil {
                navagationController.LogedInUser = email
                navagationController.isHomeActive = true
            } else {
                error = client.error ?? "Unknown error"
            }
        }
    }
   
    private func handleSignUp() {
        Task {
            let client = SignUpClient()
            client.handleSignUp(email: email, password: password, firstName: firstName, lastName: lastName)
            // Add a slight delay to wait for error assignment if needed
            try? await Task.sleep(nanoseconds: 300_000_000) // 0.3 seconds
            if client.error == nil {
                navagationController.LogedInUser = email
                navagationController.isHomeActive = true
            } else {
                error = client.error ?? "Unknown error"
            }
        }
    }
    
}
