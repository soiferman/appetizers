//
//  ProductButton.swift
//  Appetizers
//
//  Created by Max Soiferman on 10/10/23.
//

import SwiftUI

struct ProductButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.primary)
            .cornerRadius(10)
            
    }
}

#Preview {
    ProductButton(title: "Title button")
}
