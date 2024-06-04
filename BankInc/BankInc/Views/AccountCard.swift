import SwiftUI

struct AccountCard: View {
    var account: BankAccount
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(account.accountName)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Account Number: \(account.accountNumber)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Balance: \(formattedBalance)")
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
        .frame(maxWidth: .infinity)
    }
    
    private var formattedBalance: String {
        String(format: "%.2f", account.balance)
    }
}
