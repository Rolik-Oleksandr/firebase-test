import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack {
            
            NavigationLink {
                SignInEmailView()
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
        AuthenticationView()
    }
}
