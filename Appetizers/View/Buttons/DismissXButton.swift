//
//  DismissXButton.swift
//  Appetizers
//
//  Created by Max Soiferman on 10/10/23.
//

import SwiftUI

struct DismissXButton: View {
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.large)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    DismissXButton()
}
