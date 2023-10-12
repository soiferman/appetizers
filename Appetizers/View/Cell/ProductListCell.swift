//
//  ProductListCell.swift
//  Appetizers
//
//  Created by Max Soiferman on 25/9/23.
//

import SwiftUI

struct ProductListCell: View {
    
    let product: ProductModel
    
    var body: some View {
        HStack  {
            ProductRemoteImage(imageURL: product.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack (alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                //Text("$\(product.price, specifier: "%.2f")")
                Text(product.formattedPrice)
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ProductListCell(product: MockData.sampleProduct)
}
