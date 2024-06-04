import Foundation

// User service
class UserService {
    static let shared = UserService()
    
    private var users: [User] = []
    
    private init() { }
    
    func login(username: String, password: String) -> User? {
        return users.first { $0.username == username && $0.password == password }
    }
    
    func createUser(username: String, password: String) -> User {
        let newUser = User(id: UUID(), username: username, password: password, accounts: [])
        users.append(newUser)
        return newUser
    }
}
