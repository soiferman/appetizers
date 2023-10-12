//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Max Soiferman on 25/9/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
