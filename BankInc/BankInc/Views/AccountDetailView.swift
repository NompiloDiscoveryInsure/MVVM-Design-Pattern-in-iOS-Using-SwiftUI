import SwiftUI

struct AccountDetailView: View {
    var account: BankAccount

    var body: some View {
        VStack {
            Text(account.accountName)
                .font(.largeTitle)
                .padding()

            Text("Account Number: \(account.accountNumber)")
                .font(.subheadline)
                .padding()

            Text("Balance: \(String(format: "%.2f", account.balance))")
                .font(.title)
                .padding()

            if !account.transactions.isEmpty {
                List {
                    ForEach(account.transactions.sorted(by: { $0.date > $1.date }), id: \.id) { transaction in
                        TransactionRow(transaction: transaction)
                    }
                }
            } else {
                Text("No transactions available")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationTitle("Account Details")
        .navigationBarBackButtonHidden(false)
    }
}

struct TransactionRow: View {
    var transaction: Transaction

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.description)
                    .font(.headline)
                Text("\(transaction.date, formatter: dateFormatter)")
                    .font(.subheadline)
            }
            Spacer()
            Text("\(transaction.amount, specifier: "%.2f")")
                .foregroundColor(transaction.amount < 0 ? .red : .green)
        }
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
