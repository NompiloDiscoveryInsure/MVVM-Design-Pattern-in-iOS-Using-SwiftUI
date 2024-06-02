import SwiftUI

struct AccountDetailView: View {
    var account: BankAccount

    var body: some View {
        NavigationView {
            VStack {
                Text(account.accountName ?? "Unknown")
                    .font(.largeTitle)
                    .padding()

                Text("Account Number: \(account.accountNumber)")
                    .font(.subheadline)
                    .padding()

                Text("Balance: \(String(format: "%.2f", account.balance))")
                    .font(.title)
                    .padding()

                if transactionsArray.isEmpty {
                    Text("No transactions available")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(transactionsByDate.keys.sorted(), id: \.self) { date in
                            Section(header: Text("\(date, formatter: dateFormatter)")) {
                                ForEach(transactionsByDate[date]!, id: \.self) { transaction in
                                    TransactionRow(transaction: transaction)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Account Details")
        }
    }

    private var transactionsArray: [Transaction] {
        let set = account.transactions as? Set<Transaction> ?? []
        return set.sorted {
            $0.date ?? Date() > $1.date ?? Date()
        }
    }

    private var transactionsByDate: [Date: [Transaction]] {
        var groupedTransactions: [Date: [Transaction]] = [:]
        for transaction in transactionsArray {
            if let date = transaction.date {
                if groupedTransactions[date] == nil {
                    groupedTransactions[date] = [transaction]
                } else {
                    groupedTransactions[date]?.append(transaction)
                }
            }
        }
        return groupedTransactions
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}

struct TransactionRow: View {
    var transaction: Transaction

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.transactionDesciption ?? "No description")
                    .font(.headline)
                if let date = transaction.date {
                    Text("\(date, formatter: dateFormatter)")
                        .font(.subheadline)
                }
            }
            Spacer()
            Text("\(transaction.amount, specifier: "%.2f")")
                .foregroundColor(transaction.transactionType == TransactionType.fetchRequest() ? .red : .green)
        }
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
