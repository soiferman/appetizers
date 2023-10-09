//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Max Soiferman on 9/10/23.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getProducts() {
        
        isLoading = true
        
        NetworkManager.shared.getProducts { result in
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result {
                case .success(let products):
                    self.products = products
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
            
        }
    }
    
}
