import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @ObservedObject var userViewModel: UserViewModel
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Binding var isRegistrationSuccessful: Bool
    
    private var isFormValid: Bool {
        !username.isEmpty && !password.isEmpty && password == confirmPassword
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("register")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 20)
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    if isFormValid {
                        if userViewModel.createUser(username: username, password: password) != nil {
                            // User creation successful, show success alert
                            showAlert = true
                            alertMessage = "User registered successfully!"
                        } else {
                            // User creation failed, show error alert
                            showAlert = true
                            alertMessage = "User registration failed!"
                        }
                    }
                })
{
                    Text("Register")
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
            .navigationTitle("Register")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            if isRegistrationSuccessful {
                LoginView()
            } else {
                RegistrationView(userViewModel: userViewModel, isRegistrationSuccessful: $isRegistrationSuccessful)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage), dismissButton: .default(Text("OK"), action: {
                // Dismiss the view and set registration status to true
                isRegistrationSuccessful = true
                dismiss()
            }))
        }
    }
}
