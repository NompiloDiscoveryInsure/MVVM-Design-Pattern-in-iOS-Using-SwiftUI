import Foundation

class BankAccountService {
    static let shared = BankAccountService()
    
    private var accounts: [BankAccount] = []
    
    private init() { }
    
    func fetchAccounts(for user: User) -> [BankAccount] {
        var userAccounts: [BankAccount] = []
        for account in accounts {
            if account.id == user.id {
                userAccounts.append(account)
            }
        }
        return userAccounts
    }
    
    func addAccount(accountName: String, accountNumber: Int64, initialBalance: Double, for user: User) -> BankAccount {
            let newAccount = BankAccount(id: UUID(), accountName: accountName, accountNumber: accountNumber, balance: initialBalance, transactions: [])
            accounts.append(newAccount)
            return newAccount
        }
}
