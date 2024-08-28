//
//  Womens.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-12.
//


import SwiftUI

struct Womens: View {
    @EnvironmentObject var cartManager: CartManager  // Use EnvironmentObject here
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(productList, id: \.id) { product in
                    ProductCard(product: product)
                        .environmentObject(cartManager)
                }
            }
            .padding()
        }
        .navigationTitle(Text("Womens"))
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

struct Womens_Previews: PreviewProvider {
    static var previews: some View {
        Womens()
            .environmentObject(CartManager())  // Provide a CartManager instance for previews
    }
}
