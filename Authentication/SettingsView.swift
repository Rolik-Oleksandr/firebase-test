import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func reserPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSettingsView: Bool
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSettingsView = true
                    } catch {
                        print("Error \(error.localizedDescription)")
                    }
                }
            }
            Button("Reset Password") {
                Task {
                    do {
                        try await  viewModel.reserPassword()
                        print("password reset")
                    } catch {
                        print("Error \(error.localizedDescription)")
                    }
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSettingsView: .constant(false))
    }
}
