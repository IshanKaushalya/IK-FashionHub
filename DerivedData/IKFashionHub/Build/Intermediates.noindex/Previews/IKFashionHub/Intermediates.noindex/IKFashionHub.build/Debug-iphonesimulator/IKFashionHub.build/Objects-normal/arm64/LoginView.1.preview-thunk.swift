@_private(sourceFile: "LoginView.swift") import IKFashionHub
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension LoginView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Views/LoginView.swift", line: 16)
        NavigationStack {
            if userVM.authenticated {
                NavigationStack {
                    ZStack {
                        VStack {
                            Image(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "sampleMen"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 120), height: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 120))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[4].arg[0].value.modifier[0].arg[1].value", fallback: 4)))
                                .shadow(radius: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[5].arg[0].value", fallback: 7))
                                .padding(.top, __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[6].arg[1].value", fallback: 50))
                            if let user = userVM.user {
                                Text(user.fullName)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.bottom, __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].[0].[0].modifier[2].arg[1].value", fallback: 5))
                                
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].[0].[1].modifier[2].arg[1].value", fallback: 5))
                                
                                Text(user.address)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].[0].[2].modifier[2].arg[1].value", fallback: 20))
                            } else {
                                Text(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].[1].[0].arg[0].value", fallback: ""))
                                    .onAppear {
                                        userVM.fetchUser(email: userVM.email)
                                        
                                    }
                            }
                        }
                    }
                }
                
                VStack(alignment: .center, spacing: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[1].arg[1].value", fallback: 20)) {
                    Button {

                        userVM.logout()
                    } label: {
                        HStack {
                            HStack(spacing: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[0].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: 3)) {
                               
                                
                                HStack {
                                    
                                    VStack {
                                        Text(userVM.username)
                                            .bold()
                                            .padding()
                                            .foregroundColor(Color.black)
                                        
                                            .bold()
                                            .padding()
                                            .foregroundColor(Color.black)
                                        
                                        Text(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[0].arg[1].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "Sign out here"))
                                            .bold()
                                    }
                                }
                                
                            }
                            .font(.system(size: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[1].arg[2].value.[0].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 16)))
                            .tint(.red)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .opacity(__designTimeFloat("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[0].[1].modifier[0].arg[0].value", fallback: 0.8))
                Spacer()
                
                
                
            } else {
                
                Image(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[0].arg[0].value", fallback: "user"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[0].modifier[2].arg[0].value", fallback: 100), height: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[0].modifier[2].arg[1].value", fallback: 120))
                    .padding(.vertical, __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[0].modifier[3].arg[1].value", fallback: 32))
                
                VStack {
                    TextField(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[0].arg[0].value", fallback: "Email"), text: $email)
                        .frame(width: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[0].modifier[0].arg[0].value", fallback: 320), height: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[0].modifier[0].arg[1].value", fallback: 50))
                        .padding(.horizontal)
                        .background(Color.gray.opacity(__designTimeFloat("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[0].modifier[2].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                        .cornerRadius(__designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[0].modifier[3].arg[0].value", fallback: 5))
                        .textInputAutocapitalization(.never)
                    
                    SecureField(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[1].arg[0].value", fallback: "Password"), text: $password)
                        .frame(width: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[1].modifier[0].arg[0].value", fallback: 320), height: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[1].modifier[0].arg[1].value", fallback: 50))
                        .padding(.horizontal)
                        .background(Color.gray.opacity(__designTimeFloat("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[1].modifier[2].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)))
                        .cornerRadius(__designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[1].modifier[3].arg[0].value", fallback: 5))
                        .padding(.bottom, __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[1].arg[0].value.[1].modifier[4].arg[1].value", fallback: 20))
                    
                }
                .padding(.horizontal)
                .padding(.vertical)
                if userVM.showError {
                    Text(userVM.errorMessage)
                        .foregroundStyle(.red)
                        .font(.system(size: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[2].[0].[0].modifier[1].arg[0].value.arg[0].value", fallback: 14)))
                } else {
                    Text(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[2].[1].[0].arg[0].value", fallback: ""))
                }
                
                Button(action: {
                    userVM.login(email: email, password: password)
                    
                }, label: {
                    HStack {
                        Text(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[3].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "SIGN IN"))
                            .foregroundStyle(.white).bold()
                    }
                    .foregroundColor(.white)
                    .frame(width: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[3].arg[1].value.[0].modifier[1].arg[0].value", fallback: 300))
                    .frame(height: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[3].arg[1].value.[0].modifier[2].arg[0].value", fallback: 50))
                })
                .background(Color(.black))
                .cornerRadius(__designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[3].modifier[1].arg[0].value", fallback: 20))
                .padding(.top)
                
                
                
                Button(action: {
                    showingRegister = __designTimeBoolean("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[4].arg[0].value.[0].[0]", fallback: true)
                    
                }, label: {
                    HStack {
                        Text(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[4].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "Register"))
                            .foregroundStyle(.white).bold()
                    }
                    .foregroundColor(.white)
                    .frame(width: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[4].arg[1].value.[0].modifier[1].arg[0].value", fallback: 300))
                    .frame(height: __designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[4].arg[1].value.[0].modifier[2].arg[0].value", fallback: 50))
                    .background(NavigationLink(__designTimeString("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[4].arg[1].value.[0].modifier[3].arg[0].value.arg[0].value", fallback: ""), destination: RegisterView(viewModel: registerVM), isActive: $showingRegister))
                })
                .background(Color(.red))
                .cornerRadius(__designTimeInteger("#4929.[1].[7].property.[0].[0].arg[0].value.[0].[1].[4].modifier[1].arg[0].value", fallback: 20))
                .padding(.top)
                
                
                

            }
            
            
        }
    
#sourceLocation()
    }
}

import struct IKFashionHub.LoginView
#Preview {
    LoginView()
}



