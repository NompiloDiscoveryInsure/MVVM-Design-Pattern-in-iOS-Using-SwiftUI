import Foundation
import CoreData

extension BankAccount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BankAccount> {
        return NSFetchRequest<BankAccount>(entityName: "BankAccount")
    }

    @NSManaged public var accountName: String?
    @NSManaged public var accountNumber: Int64
    @NSManaged public var balance: Double
    @NSManaged public var id: UUID?
    @NSManaged public var user: User?
    @NSManaged public var transactions: NSSet?

}

extension BankAccount : Identifiable {

}

// MARK: Generated accessors for transactions
extension BankAccount {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: Transaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: Transaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}
