import Foundation
import CoreData


extension TransactionType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionType> {
        return NSFetchRequest<TransactionType>(entityName: "TransactionType")
    }

    @NSManaged public var debit: String?
    @NSManaged public var credit: String?

}

extension TransactionType : Identifiable {

}
