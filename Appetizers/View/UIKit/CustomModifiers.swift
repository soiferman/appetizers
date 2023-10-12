//
//  CustomModifier.swift
//  Appetizers
//
//  Created by Max Soiferman on 12/10/23.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}
