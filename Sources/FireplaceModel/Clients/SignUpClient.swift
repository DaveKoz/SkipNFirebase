//
//  SignUpClient.swift
//  SkipNFirebase
//
//  Created by David Kozikowski on 5/5/25.
//
#if !SKIP_BRIDGE
import Foundation
#if SKIP
import SkipFirebaseAuth
import SkipFirebaseFirestore
#else
import FirebaseAuth
import FirebaseFirestore
#endif


public class SignUpClient {

    public init() {}

    public var error: String?

    public func handleSignUp(email: String, password: String, firstName: String, lastName: String) {
        Task {
            do {
                let user = try await Auth.auth().createUser(withEmail: email, password: password).user
                let uid = user.uid

                let userData: [String: Any] = [
                    "uid": uid,
                    "email": email,
                    "firstName": firstName,
                    "lastName": lastName,
                    "createdAt": Timestamp(date: Date()),
                    "updatedAt": Timestamp(date: Date())
                ]

                let db = Firestore.firestore()
                try await db.collection("users").document(uid).setData(userData)

                print("User successfully created and stored with ID: \(uid)")
            } catch {
                print("Error during account creation: \(error.localizedDescription)")
                self.error = error.localizedDescription
            }
        }
    }
}

#endif
