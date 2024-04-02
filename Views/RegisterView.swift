import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    @State private var fullName = ""
    @State private var telno = ""
    @State private var email = ""
    @State private var address = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingLogin = false // State variable to control navigation
    @State private var showingSuccessAlert = false // State variable to show success alert
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Register")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.top, 20)
                    Spacer()
                
                TextField("Full Name", text: $fullName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Telephone Number", text: $telno)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Address", text: $address)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                Spacer()
                
                if viewModel.showError {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    viewModel.registerUser(fullName: fullName, telno: telno, email: email, address: address, password: password)
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                
                Button(action: {
                    // Set the state variable to true to navigate to the Login view
                    showingLogin = true
                        
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
                .padding()
                .padding(.bottom, 40)
                .background(NavigationLink("", destination: LoginView(), isActive: $showingLogin))
            }
            .padding(.vertical)
            .navigationBarHidden(true) // Hide navigation bar
            .alert(isPresented: $viewModel.showSuccess) {
                Alert(title: Text("Success"), message: Text("Registration successful"), dismissButton: .default(Text("OK")) {
                    // Navigate to Login view after dismissing the alert
                    showingLogin = true
                })
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: RegisterViewModel())
    }
}
