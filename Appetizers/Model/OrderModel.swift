//
//  OrderModel.swift
//  Appetizers
//
//  Created by Max Soiferman on 12/10/23.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [ProductModel] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    func add(_ product: ProductModel) {
        items.append(product)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    
    
}
