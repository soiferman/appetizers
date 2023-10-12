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
        ZStack {
            NavigationView {
                List(viewModel.products, id: \.id) { product in
                    ProductListCell(product: product)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedProduct = product
                        }
                }
                .navigationTitle("🍟 Products")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear {
                viewModel.getProducts()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            .onTapGesture {
                viewModel.isShowingDetail = false
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(product: viewModel.selectedProduct!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
        
    }
}

#Preview {
    AppetizerListView()
}
