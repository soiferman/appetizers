//
//  ActivityView.swift
//  Appetizers
//
//  Created by Max Soiferman on 9/10/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .primary))
        }
    }
    
}
