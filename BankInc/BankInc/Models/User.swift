import Foundation

struct User: Identifiable {
    var id: UUID
    var username: String
    var password: String
    var accounts: [BankAccount]
}
