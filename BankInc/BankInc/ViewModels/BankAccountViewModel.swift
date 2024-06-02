import Foundation
import CoreData

class BankAccountViewModel: ObservableObject {
    @Published var bankAccounts: [BankAccount] = []
    private let context = PersistenceController.shared.container.viewContext

    init(user: User) {
        self.fetchAccounts(for: user)
    }

    func fetchAccounts(for user: User) {
        if let accounts = user.account {
            self.bankAccounts = [accounts]
        }
    }

    func addAccount(accountName: String, accountNumber: Int64, initialBalance: Double, for user: User) {
        let newAccount = BankAccount(context: context)
        newAccount.id = UUID()
        newAccount.accountNumber = accountNumber
        newAccount.accountName = accountName
        newAccount.balance = initialBalance
        newAccount.user = user

        saveContext()
        fetchAccounts(for: user)
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
}
