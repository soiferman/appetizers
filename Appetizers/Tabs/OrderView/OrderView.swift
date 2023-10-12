//
//  OrderView.swift
//  Appetizers
//
//  Created by Max Soiferman on 25/9/23.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems, id: \.id) { product in
                            ProductListCell(product: product)
                        }
                        .onDelete(perform: { indexSet in
                            deleteItems(at: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    
                    if !orderItems.isEmpty {
                        Button {
                            print("placed")
                        } label: {
                            ProductButton(title: "$99.99 - Place Order")
                        }
                        .padding(.bottom, 25)
                        .transition(AnyTransition.opacity.animation(.linear(duration: 0.2)))
                    }
                }
                
                if orderItems.isEmpty {
                    ContentUnavailableView("You have no items at your order",
                                           systemImage: "list.bullet.rectangle",
                                           description: Text("Please add appertizer"))
                    .padding(.bottom, 60)
                }
            }
            .navigationTitle("🛍️ Order")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
