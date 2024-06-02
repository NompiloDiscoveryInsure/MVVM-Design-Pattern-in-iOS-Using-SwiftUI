import SwiftUI
import CoreData

struct BankDashboardView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @ObservedObject private var accountViewModel: BankAccountViewModel

    init(userViewModel: UserViewModel) {
        self._accountViewModel = ObservedObject(wrappedValue: BankAccountViewModel(user: userViewModel.user ?? User(context: PersistenceController.shared.container.viewContext)))
    }

    var body: some View {
        NavigationView {
            List(accountViewModel.bankAccounts) { account in
                NavigationLink(destination: AccountDetailView(account: account)) {
                    VStack(alignment: .leading) {
                        Text(account.accountName ?? "Unknown")
                            .font(.headline)
                        Text("Balance: \(account.balance)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Bank Accounts")
            .toolbar {
                Button("Add Account") {
                    // Present form to add a new account
                    // Add your code here
                }
            }
        }
        .onAppear {
            if let user = userViewModel.user {
                accountViewModel.fetchAccounts(for: user) // Provide the 'for' parameter
            }
        }
    }
}
