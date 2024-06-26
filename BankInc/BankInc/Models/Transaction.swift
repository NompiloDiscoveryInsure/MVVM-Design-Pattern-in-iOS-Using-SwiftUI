import Foundation

struct Transaction: Identifiable {
    var id: UUID
    var amount: Double
    var date: Date
    var description: String
    var type: TransactionType
}
