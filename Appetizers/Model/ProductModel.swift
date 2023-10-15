//
//  ProductModel.swift
//  Appetizers
//
//  Created by Max Soiferman on 25/9/23.
//

import Foundation

struct ProductModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
    var formattedPrice: String {
        "$" + String(format: "%.2f", price)
        
    }
}

struct ProductResponse: Decodable {
    let request: [ProductModel]
}

struct MockData {
    
    static let sampleProduct = ProductModel(id: 001,
                                            name: "Test Appetizer",
                                            description: "Appetizer description a lot of text for testing",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 300,
                                            protein: 15,
                                            carbs: 65)
    
    static let sampleProducts = [sampleProduct, sampleProduct, sampleProduct, sampleProduct, sampleProduct]
    
    static let orderItemOne = ProductModel(id: 001,
                                            name: "Test Appetizer one",
                                            description: "Appetizer description a lot of text for testing",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 300,
                                            protein: 15,
                                            carbs: 65)
    
   static let orderItemTwo = ProductModel(id: 002,
                                            name: "Test Appetizer two",
                                            description: "Appetizer description a lot of text for testing",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 300,
                                            protein: 15,
                                            carbs: 65)
    
    static let orderItemThree = ProductModel(id: 003,
                                            name: "Test Appetizer three",
                                            description: "Appetizer description a lot of text for testing",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 300,
                                            protein: 15,
                                            carbs: 65)
    
    static var orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
