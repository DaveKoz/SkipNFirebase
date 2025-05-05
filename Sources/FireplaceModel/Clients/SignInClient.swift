//
//  SignInClient.swift
//  SkipNFirebase
//
//  Created by David Kozikowski on 5/5/25.
//
//

#if !SKIP_BRIDGE

#if SKIP
import SkipFirebaseAuth
import SkipFirebaseFirestore
#else
import FirebaseAuth
import FirebaseFirestore
#endif


public class SignInClient {

    public init() {}

    public var error: String?

    public func handleSignIn(email: String, password: String) {
        Task {
            do {
                let result = try await Auth.auth().signIn(withEmail: email, password: password)
                print("Successfully signed in user with uid: \(result.user.uid)")
            } catch {
                print("Error Signing In: \(error.localizedDescription)")
                self.error = error.localizedDescription
            }
        }
    }
}

#endif

