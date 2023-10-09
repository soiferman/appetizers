//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Max Soiferman on 25/9/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.products, id: \.id) { product in
                ProductListCell(product: product)
            }
            .navigationTitle("🍟 Products")
        }.onAppear {
            viewModel.getProducts()
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
        
    }
}

#Preview {
    AppetizerListView()
}
