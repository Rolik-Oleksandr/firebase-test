import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    init() {
        
    }
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("🛑No such input data")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("✅Success \(returnedUserData)")
            } catch {
                print("🛑Error \(error)")
            }
        }
    }
    
}

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                viewModel.signIn()
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue) 
            }
        }
        .padding()
        .navigationTitle(Text("Sign In with Email"))
    }
}

#Preview {
    NavigationStack {
        SignInEmailView()
    }
}
