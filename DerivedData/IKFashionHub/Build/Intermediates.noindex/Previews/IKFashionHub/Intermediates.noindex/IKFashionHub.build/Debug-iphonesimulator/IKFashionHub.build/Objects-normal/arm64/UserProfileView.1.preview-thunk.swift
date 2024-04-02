@_private(sourceFile: "UserProfileView.swift") import IKFashionHub
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension UserProfileView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Views/UserProfileView.swift", line: 54)
        UserProfileView(userVM: UserViewModel())
    
#sourceLocation()
    }
}

extension UserProfileView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/navodyasajanarupasinghe/Downloads/IK-FashionHub/Views/UserProfileView.swift", line: 14)
        VStack {
            HStack {
                Image(systemName: __designTimeString("#12950.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "person.circle"))
                    .font(.system(size: __designTimeInteger("#12950.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 60)))
                    .padding()
                
                if let user = userVM.user {
                    VStack(alignment: .leading) {
                        Text(__designTimeString("#12950.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value", fallback: "User Profile"))
                            .font(.title)
                            .padding(.bottom)
                        
                        Text("Name: \(user.fullName)")
                        Text("Email: \(user.email)")
                        Text("Address: \(user.address)")
                        Text("Telephone:\(user.telno)")
                        // Add more user details as needed
                    }
                } else {
                    Text(__designTimeString("#12950.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[1].[1].[0].arg[0].value", fallback: "Loading..."))
                }
            }
            
            Button(action: {
                // Implement edit profile functionality
            }) {
                Text(__designTimeString("#12950.[1].[1].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Edit Profile"))
            }
            .padding()
        }
        .onAppear {
//            if let email = userVM.username {
//                userVM.fetchUser(email: email)
//            }
        }
    
#sourceLocation()
    }
}

import struct IKFashionHub.UserProfileView
import struct IKFashionHub.UserProfileView_Previews

