import Foundation
import CoreData

class UserViewModel: ObservableObject {
    @Published var user: User?
    private let context = PersistenceController.shared.container.viewContext

    func login(username: String, password: String) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)

        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                self.user = user
            } else {
                // Create a new user if not found
                createUser(username: username, password: password)
            }
        } catch {
            print("Login error: \(error.localizedDescription)")
        }
    }

    private func createUser(username: String, password: String) {
        let newUser = User(context: context)
        newUser.id = UUID()
        newUser.username = username
        newUser.password = password

        saveContext()
        self.user = newUser
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
}
