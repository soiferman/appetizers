//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Max Soiferman on 25/9/23.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.sampleProducts, id: \.id) { product in
               ProductListCell(product: product)
            }
            .navigationTitle("🍟 Products")
        }
        
    }
}

#Preview {
    AppetizerListView()
}
