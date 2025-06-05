import SwiftUI

struct AuthenticationView: View {
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sing in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(Text("Authentication"))
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(true))
    }
}
