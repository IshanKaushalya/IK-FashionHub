//
//  ProductViewModel.swift
//  IKFashionHub
//
//  Created by Ishan Kaushalya on 2024-03-28.
//


import Foundation
import SwiftUI

class ClothViewModel: ObservableObject {
    
    @Published var clothingDM = [ClothDataModel]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "http://localhost:3030/api/Products") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
    func fetchData(forCategory category: String) {
        let dataURL = "http://localhost:3030/api/Products/\(category)"
        
        guard let url = URL(string: dataURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
    
    func fetchData(forSubcategory subCategory: String) {
        let dataURL = "http://localhost:3030/api/Products/subCategory/\(subCategory)"
        
        guard let url = URL(string: dataURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
    
    func fetchData(forSubcategory subcategory: String, inCategory category: String) {
        let formattedCategory = category.capitalized
        let formattedSubcategory = subcategory.lowercased()
        
        let dataURL = "http://localhost:3030/api/Products/\(formattedCategory)/\(formattedSubcategory)"
        
        guard let url = URL(string: dataURL) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil,
               let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            } else {
                print("Fetch error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
    func fetchData(forQuery query: String) {
        guard let url = URL(string: "http://localhost:3030/api/search?query=\(query)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    func fetchData(forQueries query: String) {
        // Your existing implementation for fetching data based on query
    }
    
    // New method for fetching sorted products
    func fetchSortedData(order: String) {
        guard let url = URL(string: "http://localhost:3030/api/sortByPrice?order=\(order)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
//    func fetchData(id: Int) {
//        guard let url = URL(string: "http://localhost:3030/api/Products/\(id)") else {
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Error: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            
//            if let decodedResponse = try? JSONDecoder().decode[ClothDataModel].self, from: data) {
//                DispatchQueue.main.async {
//                    self.clothingDM = decodedResponse
//                }
//            }
//            
//        }.resume()
//    }
    
    func fetchData(id: Int) {
        guard let url = URL(string: "http://localhost:3030/api/Productss/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ClothDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.clothingDM = decodedResponse
                }
            }
        }.resume()
    }
    
    @Published private(set) var items : [ClothDataModel] = []
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var showSuccess: Bool = false
    
    func addToCart(itemID: String,userID: String,size: String,qty: String){
        guard let url = URL(string: "http://localhost:3000/api/cart") else {
            print("Invalid URL")
            return
        }
        let quantity = (qty as NSString).integerValue
        let item_id = (itemID as NSString).integerValue
        let userData = ClothDataModel(item_id: item_id, user_id: userID, size: size, qty: quantity)
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
                self.errorMessage = "something went wrong"
                return
            }
            
            if httpResponse.statusCode == 200 {
                self.showSuccess = true
            }
        }.resume()
    }
}



