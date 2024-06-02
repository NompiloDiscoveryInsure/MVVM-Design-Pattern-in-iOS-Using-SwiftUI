import SwiftUI

struct LoginView: View {
    @StateObject private var userViewModel = UserViewModel()
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    userViewModel.login(username: username, password: password)
                    if userViewModel.user != nil {
                        isLoggedIn = true
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Login")
            .navigationDestination(isPresented: $isLoggedIn) {
                BankDashboardView(userViewModel: userViewModel).environmentObject(userViewModel)
            }
        }
    }
}
