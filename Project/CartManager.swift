//
//  CartManager.swift
//  Project
//
//  Created by Amritpal Gill on 2024-07-04.
//

import Foundation

//class CartManager: ObservableObject {
//    @Published private(set) var products: [Product] = []
//    @Published private(set) var total: Int = 0
//    
//    func addToCart(product: Product) {
//        products.append(product)
//        total += product.price
//    }
//    
//    func removeFromCart(product: Product) {
//        products = products.filter {$0.id != product.id }
//        total -= product.price
//    }
//}


class CartManager: ObservableObject {
    @Published var products: [Product] = []
    
    var total: Int {
        products.reduce(0) { $0 + $1.price }
    }
    
    func addToCart(product: Product) {
        products.append(product)
    }
    
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
    
    
}
