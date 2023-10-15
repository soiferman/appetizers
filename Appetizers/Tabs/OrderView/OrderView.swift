//
//  OrderView.swift
//  Appetizers
//
//  Created by Max Soiferman on 25/9/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { product in
                            ProductListCell(product: product)
                        }
                        .onDelete(perform: { indexSet in
                            order.deleteItems(at: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    
                    if !order.items.isEmpty {
                        Button {
                            print("order placed")
                        } label: {
                            //                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                            Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        }
                        .modifier(StandartButtonStyle())
                        .padding(.bottom, 25)
                    }
                }
                
                if order.items.isEmpty {
                    ContentUnavailableView("You have no items at your order",
                                           systemImage: "list.bullet.rectangle",
                                           description: Text("Please add appertizer"))
                    .padding(.bottom, 60)
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
