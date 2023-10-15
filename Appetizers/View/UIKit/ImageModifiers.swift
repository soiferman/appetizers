//
//  ImageModifiers.swift
//  Appetizers
//
//  Created by Max Soiferman on 14/10/23.
//

import SwiftUI

struct ImageModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .cornerRadius(10)
    }
    
}
