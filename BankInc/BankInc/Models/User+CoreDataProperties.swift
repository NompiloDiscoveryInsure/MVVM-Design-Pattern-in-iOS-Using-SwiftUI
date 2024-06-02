import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var account: BankAccount?

}

extension User : Identifiable {

}
