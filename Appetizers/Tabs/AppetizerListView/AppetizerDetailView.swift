//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Max Soiferman on 9/10/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let product: ProductModel
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            ProductRemoteImage(imageURL: product.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(product.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }
            
            HStack(spacing: 40) {
                NutritionInfo(title: "Calories", value: ("\(product.calories) g"))
                NutritionInfo(title: "Carbs", value: ("\(product.carbs) g"))
                NutritionInfo(title: "Protein", value: ("\(product.protein) g"))
            }
            
            Spacer()
            
            Button {
                order.add(product)
                isShowingDetail = false
            } label: {
                //ProductButton(title: "\(product.price, specifier: "%.2f") - Add to Order")
                Text("\(product.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandartButtonStyle())
            .padding(.bottom, 30)
        }
        
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            DismissXButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(product: MockData.sampleProduct, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
    
}
