//
//  Kids.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-05.
//




import SwiftUI

struct Kids: View {
    @EnvironmentObject var cartManager: CartManager  // Use EnvironmentObject here
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(productList2, id: \.id) { product in
                    ProductCard(product: product)
                        .environmentObject(cartManager)
                }
            }
            .padding()
        }
        .navigationTitle(Text("Kids"))
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

struct Kids_Previews: PreviewProvider {
    static var previews: some View {
        Kids()
            .environmentObject(CartManager())  // Provide a CartManager instance for previews
    }
}
