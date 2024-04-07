//
//  OrderDataModel.swift
//  IKFashionHub
//
//  Created by Sajana Rupasinghe on 2024-03-31.
//

import Foundation

struct OrderDataModel: Codable {
    var email: String
    var total: String
    var date: String
}

struct OrderDataRetrieveModel: Codable{
    var id: Int
    var date: String
    var total: Double
    var email: String
}
