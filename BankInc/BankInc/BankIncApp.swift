import SwiftUI

@main
struct BankIncApp: App {
    @StateObject private var userViewModel = UserViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplashScreenView()
                    .environmentObject(userViewModel)
            }
        }
    }
}

