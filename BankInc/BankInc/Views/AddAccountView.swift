import SwiftUI

struct AddAccountView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var userViewModel: UserViewModel
    @State private var accountName = ""
    @State private var accountNumber = ""
    @State private var initialBalance = ""
    @State private var isNewAccountCreated = false
    
    private var isFormValid: Bool {
        !accountName.isEmpty && !accountNumber.isEmpty && Double(initialBalance) != nil
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Account Name", text: $accountName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Account Number", text: $accountNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                
                TextField("Initial Balance", text: $initialBalance)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.decimalPad)
                // Display the flag if a new account is created
                if isNewAccountCreated {
                    Text("New account created!")
                        .foregroundColor(.green)
                }
                
                Button(action: {
                    if isFormValid, let user = userViewModel.user {
                        _ = BankAccountService.shared.addAccount(accountName: accountName, accountNumber: Int64(accountNumber) ?? 0, initialBalance: Double(initialBalance) ?? 0.0, for: user)
                        
                        // Set the flag to true to indicate that a new account was created
                        isNewAccountCreated = true
                        dismiss()
                    }
                }) {
                    Text("Add Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(isFormValid ? Color.purple : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(!isFormValid)
                .padding()

            }
            .background(Color(UIColor.clear).ignoresSafeArea())
            .navigationTitle("Add Account")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
