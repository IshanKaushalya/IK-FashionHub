import Foundation
import SwiftUI


class RegisterViewModel : ObservableObject {
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var showSuccess : Bool = false
    
    func registerUser(fullName: String, telno: String, email: String, address: String , password: String) {
        if email.isEmpty {
            showError = true
            errorMessage = "Email cannot be empty"
        } else if fullName.isEmpty {
            showError = true
            errorMessage = "Name cannot be empty"
        }else if address.isEmpty{
            showError = true
            errorMessage = "address cannot be empty"
        }
        else if password.isEmpty {
            showError = true
            errorMessage = "Password cannot be empty"
//        }else if confPwd.isEmpty {
//            showError = true
//            errorMessage = "You must confirm the password"
//        } else if password != confPwd {
//            showError = true
//            errorMessage = "Password must be matched"
       } else {
            guard let url = URL(string: "http://localhost:3030/api/users/register") else {
                print("Invalid URL")
                return
            }
            let telephone = (telno as NSString).integerValue
            let userData = UserDataModel(fullName: fullName, telno: "\(telephone)", email: email, address: address, password: password)
            guard let jsonData = try? JSONEncoder().encode(userData) else {
                self.showError = true
                self.errorMessage = "Failed to encode user data"
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { UserData, response, error in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    self.showError = true
                    //self.errorMessage = "Error: \(error?.localizedDescription ?? "Unknown error")"
                    self.errorMessage = "User exits or something went wrong"
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    self.showSuccess = true
                }
            }.resume()
        }
    }
}
