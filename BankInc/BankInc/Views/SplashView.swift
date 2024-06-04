import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        VStack(spacing: 15) {
            Image("splash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350)
            Text("Welcome to BankInc")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            LoginView()
        }
    }
}
