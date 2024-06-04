import SwiftUI

struct LoginView: View {
    @StateObject private var userViewModel = UserViewModel()
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var showRegistration = false
    @State private var isRegistrationSuccessful = false

    private var isFormValid: Bool {
        !username.isEmpty && !password.isEmpty
    }

    var body: some View {
        NavigationStack {
            VStack {
                Image("login")
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

                Button(action: {
                    if isFormValid {
                        userViewModel.login(username: username, password: password)
                        if userViewModel.user != nil {
                            isLoggedIn = true
                        }
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(isFormValid ? Color.purple : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(!isFormValid)
                .padding()

                Button(action: {
                    showRegistration = true
                }) {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple, lineWidth: 2)
                        )
                }
                .padding()
            }
            .background(Color(UIColor.clear).ignoresSafeArea())
            .navigationDestination(isPresented: $isLoggedIn) {
                BankDashboardView(userViewModel: userViewModel)
            }
            .sheet(isPresented: $showRegistration) {
                RegistrationView(userViewModel: userViewModel, isRegistrationSuccessful: $isRegistrationSuccessful)
            }

        }
    }
}
