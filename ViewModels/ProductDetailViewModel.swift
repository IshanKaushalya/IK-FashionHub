//
//  ProductDetailViewModel.swift
//  IKFashionHub
//
//  Created by Sajana Rupasinghe on 2024-04-07.
//

import Foundation
import SwiftUI

class ProductDetailViewModel : ObservableObject {
    //@Published var itemDM: ItemDataModel?
    @Published private(set) var items : [ClothDataModel] = []
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var showSuccess: Bool = false
    
    func addToCart(itemID: String,userID: String,size: String,qty: String){
        guard let url = URL(string: "http://localhost:3030/api/cart") else {
            print("Invalid URL")
            return
        }
        let quantity = (qty as NSString).integerValue
        let item_id = (itemID as NSString).integerValue
        let userData = ProducDetailModel(item_id: item_id, user_id: userID, size: size, qty: quantity)
        guard let jsonData = try? JSONEncoder().encode(userData) else {
            self.showError = true
            self.errorMessage = "Failed to encode cart data"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                self.showError = true
                self.errorMessage = "Error: \(error?.localizedDescription ?? "Unknown error")"
                self.errorMessage = "Error: \(error)"
                //self.errorMessage = "something went wrong"
                return
            }
            
            if httpResponse.statusCode == 200 {
                self.showSuccess = true
            }
        }.resume()
    }
}
