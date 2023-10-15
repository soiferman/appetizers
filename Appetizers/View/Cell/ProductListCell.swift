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
//            ProductRemoteImage(imageURL: product.imageURL)
//                .modifier(ImageModifiers())
            
            //does'n suppport cache
            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .modifier(ImageModifiers())
                
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .modifier(ImageModifiers())
            }

            
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
