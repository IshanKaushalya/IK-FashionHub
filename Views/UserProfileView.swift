//
//  UserProfileView.swift
//  IKFashionHub
//
//  Created by Sajana Rupasinghe on 2024-04-02.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var userVM: UserViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .font(.system(size: 60))
                    .padding()
                
                if let user = userVM.user {
                    VStack(alignment: .leading) {
                        Text("User Profile")
                            .font(.title)
                            .padding(.bottom)
                        
                        Text("Name: \(user.fullName)")
                        Text("Email: \(user.email)")
                        Text("Address: \(user.address)")
                        Text("Telephone:\(user.telno)")
                        // Add more user details as needed
                    }
                } else {
                    Text("Loading...")
                }
            }
            
            Button(action: {
                // Implement edit profile functionality
            }) {
                Text("Edit Profile")
            }
            .padding()
        }
        .onAppear {
//            if let email = userVM.username {
//                userVM.fetchUser(email: email)
//            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(userVM: UserViewModel())
    }
}

