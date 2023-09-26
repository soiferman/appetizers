//
//  ProductModel.swift
//  Appetizers
//
//  Created by Max Soiferman on 25/9/23.
//

import Foundation

struct ProductModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct ProductResponse {
    let request: [ProductModel]
}

struct MockData {
    
    static let sampleProduct = ProductModel(id: 001,
                                            name: "Test Appetizer",
                                            description: "Appetizer description",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 300,
                                            protein: 15,
                                            carbs: 65)
    
    static let sampleProducts = [sampleProduct, sampleProduct, sampleProduct, sampleProduct, sampleProduct]
    
}
