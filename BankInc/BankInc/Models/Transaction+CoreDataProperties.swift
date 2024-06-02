//
//  Transaction+CoreDataProperties.swift
//  BankInc
//
//  Created by Nompilo Moyo on 2024/06/02.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var amount: Double
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var transactionDesciption: String?
    @NSManaged public var transactionType: Transaction?
    @NSManaged public var account: BankAccount?

}

extension Transaction : Identifiable {

}
