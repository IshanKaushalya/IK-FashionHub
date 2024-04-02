@_private(sourceFile: "RegisterView.swift") import IKFashionHub
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension RegisterView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Views/RegisterView.swift", line: 105)
        RegisterView(viewModel: RegisterViewModel())
    
#sourceLocation()
    }
}

extension RegisterView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Views/RegisterView.swift", line: 16)
        NavigationView {
            VStack {
                Text(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "Register"))
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.top, __designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[3].arg[1].value", fallback: 20))
                    Spacer()
                
                TextField(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[2].arg[0].value", fallback: "Full Name"), text: $fullName)
                    .padding()
                    .background(Color.gray.opacity(__designTimeFloat("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[2].modifier[1].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                    .cornerRadius(__designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[2].modifier[2].arg[0].value", fallback: 8))
                    .padding(.horizontal)
                
                TextField(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[0].value", fallback: "Telephone Number"), text: $telno)
                    .padding()
                    .background(Color.gray.opacity(__designTimeFloat("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[3].modifier[1].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                    .cornerRadius(__designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[3].modifier[2].arg[0].value", fallback: 8))
                    .padding(.horizontal)
                
                TextField(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value", fallback: "Email"), text: $email)
                    .padding()
                    .background(Color.gray.opacity(__designTimeFloat("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[4].modifier[1].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                    .cornerRadius(__designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[4].modifier[2].arg[0].value", fallback: 8))
                    .padding(.horizontal)
                
                TextField(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[5].arg[0].value", fallback: "Address"), text: $address)
                    .padding()
                    .background(Color.gray.opacity(__designTimeFloat("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[5].modifier[1].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                    .cornerRadius(__designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[5].modifier[2].arg[0].value", fallback: 8))
                    .padding(.horizontal)
                
                SecureField(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[6].arg[0].value", fallback: "Password"), text: $password)
                    .padding()
                    .background(Color.gray.opacity(__designTimeFloat("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[6].modifier[1].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                    .cornerRadius(__designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[6].modifier[2].arg[0].value", fallback: 8))
                    .padding(.horizontal)
                
                SecureField(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[7].arg[0].value", fallback: "Confirm Password"), text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(__designTimeFloat("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[7].modifier[1].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                    .cornerRadius(__designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[7].modifier[2].arg[0].value", fallback: 8))
                    .padding(.horizontal)
                Spacer()
                
                if viewModel.showError {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    viewModel.registerUser(fullName: fullName, telno: telno, email: email, address: address, password: password)
                }) {
                    Text(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[10].arg[1].value.[0].arg[0].value", fallback: "Register"))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(__designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[10].arg[1].value.[0].modifier[4].arg[0].value", fallback: 8))
                        .padding(.horizontal)
                }
                
                Button(action: {
                    // Set the state variable to true to navigate to the Login view
                    showingLogin = __designTimeBoolean("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[11].arg[0].value.[0].[0]", fallback: true)
                        
                }) {
                    Text(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[11].arg[1].value.[0].arg[0].value", fallback: "Cancel"))
                        .foregroundColor(.red)
                }
                .padding()
                .padding(.bottom, __designTimeInteger("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[11].modifier[1].arg[1].value", fallback: 40))
                .background(NavigationLink(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[11].modifier[2].arg[0].value.arg[0].value", fallback: ""), destination: LoginView(), isActive: $showingLogin))
            }
            .padding(.vertical)
            .navigationBarHidden(__designTimeBoolean("#9132.[1].[9].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: true)) // Hide navigation bar
            .alert(isPresented: $viewModel.showSuccess) {
                Alert(title: Text(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].modifier[2].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "Success")), message: Text(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].modifier[2].arg[1].value.[0].arg[1].value.arg[0].value", fallback: "Registration successful")), dismissButton: .default(Text(__designTimeString("#9132.[1].[9].property.[0].[0].arg[0].value.[0].modifier[2].arg[1].value.[0].arg[2].value.arg[0].value.arg[0].value", fallback: "OK"))) {
                    // Navigate to Login view after dismissing the alert
                    showingLogin = true
                })
            }
        }
    
#sourceLocation()
    }
}

import struct IKFashionHub.RegisterView
import struct IKFashionHub.RegisterView_Previews

