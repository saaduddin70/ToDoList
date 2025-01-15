import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var isRegistered = false // Added to track registration success

    init() { }

    func register() {
        guard validate() else {
            // Optionally, handle validation failure (e.g., alert the user)
            return
        }

        // Create a new user
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                // Handle errors here, such as a user-friendly message
                print("Registration error: \(error.localizedDescription)")
                return
            }
            
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
            DispatchQueue.main.async {
                self?.isRegistered = true // Notify the view of registration success
            }
        }
    }

    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)

        let db = Firestore.firestore()

        db.collection("users")
          .document(id)
          .setData(newUser.asDictionary()) { error in
              if let error = error {
                  print("Error writing user to Firestore: \(error.localizedDescription)")
              }
          }
    }

    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              email.contains("@"),
              email.contains("."),
              password.count >= 6 else {
            return false
        }
        
        return true
    }
}
