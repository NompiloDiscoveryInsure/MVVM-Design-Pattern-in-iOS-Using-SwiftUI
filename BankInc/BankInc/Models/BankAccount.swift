import Foundation

struct BankAccount: Identifiable {
    var id: UUID
    var accountName: String
    var accountNumber: Int64
    var balance: Double
    var transactions: [Transaction]
}
