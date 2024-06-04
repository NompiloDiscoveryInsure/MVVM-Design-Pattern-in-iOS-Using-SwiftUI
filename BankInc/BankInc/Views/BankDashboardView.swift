import SwiftUI

struct BankDashboardView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @ObservedObject private var accountViewModel: BankAccountViewModel
    @State private var showAddAccount = false
    @State private var selectedAccount: BankAccount?
    
    init(userViewModel: UserViewModel) {
        let user = userViewModel.user ?? User(id: UUID(), username: "default_username", password: "default_password", accounts: [])
        self._accountViewModel = ObservedObject(wrappedValue: BankAccountViewModel(user: user))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("dashboard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 20)
                
                Text("Welcome \(userViewModel.user?.username ?? "Guest")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Your Accounts")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.top, 10)
                AccountCard(account: BankAccount(id: UUID(), accountName: "Savings", accountNumber: 12345, balance: 600, transactions: []))
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(accountViewModel.bankAccounts) { account in
                            AccountCard(account: account)
                                .onTapGesture {
                                    selectedAccount = account
                                }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                
                Spacer()
                
                Button(action: {
                    showAddAccount = true
                }) {
                    Text("Add Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding(.bottom)
            }
            .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
            .fullScreenCover(isPresented: $showAddAccount) {
                AddAccountView(userViewModel: userViewModel)
            }
            .sheet(item: $selectedAccount) { account in
                AccountDetailView(account: account)
            }
        }
    }
}
