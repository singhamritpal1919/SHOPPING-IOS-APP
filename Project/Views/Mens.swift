//
//  Mens.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-07-09.
//


import SwiftUI

struct Mens: View {
    @EnvironmentObject var cartManager: CartManager  // Use EnvironmentObject here
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(productList1, id: \.id) { product in
                    ProductCard(product: product)
                        .environmentObject(cartManager)
                }
            }
            .padding()
        }
        .navigationTitle(Text("Mens"))
        .toolbar {
            NavigationLink {
                CartView()
                    .environmentObject(cartManager)
            } label: {
                CartButton(numberOfProducts: cartManager.products.count)
            }
        }
    }
}

struct Mens_Previews: PreviewProvider {
    static var previews: some View {
        Mens()
            .environmentObject(CartManager())  // Provide a CartManager instance for previews
    }
}
