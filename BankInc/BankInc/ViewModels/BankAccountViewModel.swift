import Foundation

class BankAccountViewModel: ObservableObject {
    @Published var bankAccounts: [BankAccount] = []
    private var user: User

    init(user: User) {
        self.user = user
        self.fetchAccounts()
    }

    func fetchAccounts() {
        self.bankAccounts = BankAccountService.shared.fetchAccounts(for: user)
    }

    func addAccount(accountName: String, accountNumber: Int64, initialBalance: Double) {
        _ = BankAccountService.shared.addAccount(accountName: accountName, accountNumber: accountNumber, initialBalance: initialBalance, for: user)
        fetchAccounts()
    }
}
