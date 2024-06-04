import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var isNewAccountCreated = false

    func login(username: String, password: String) {
        if let user = UserService.shared.login(username: username, password: password) {
            self.user = user
        } else {
            self.user = createUser(username: username, password: password)
        }
    }

    func createUser(username: String, password: String) -> User {
        let newUser = UserService.shared.createUser(username: username, password: password)
        self.user = newUser
        return newUser
    }
}
