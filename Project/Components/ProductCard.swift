//
//  ProductCard.swift
//  Project
//
//  Created by Amritpal Gill on 2024-07-03.
//

import SwiftUI

//struct ProductCard: View {
//    @EnvironmentObject var cartManager: CartManager
//    var product: Product
//    
//    var body: some View {
//        ZStack(alignment: .topTrailing){
//            ZStack(alignment: .bottom){
//                Image(product.image)
//                    .resizable()
//                    .cornerRadius(20)
//                    .frame(width: 180)
//                    .scaledToFit()
//                VStack(alignment: .leading){
//                    Text(product.name)
//                        .bold()
//                    
//                    Text("\(product.price)$")
//                        .font(.caption)
//                }
//                .padding()
//                .frame(width: 180, alignment: .leading)
//                .background(.ultraThinMaterial)
//                .cornerRadius(20)
//            }
//            .frame(width: 100, height: 250)
//            .shadow(radius: 3)
//            
//            Button{
//                cartManager.addToCart(product: product)
//            } label: {
//                Image(systemName: "plus")
//                    .padding(10)
//                    .foregroundColor(.white)
//                    .background(.black)
//                    .cornerRadius(50)
//                    .padding()
//            }
//            .offset(x: +47, y: -10) 
//        }
//    }
//}
//
//struct ProductCard_Preview: PreviewProvider {
//    static var previews: some View {
//        ProductCard(product: productList[0])
//            .environmentObject(CartManager())
//    }
//}

struct ProductCard: View {
    var product: Product
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
            Text(product.name)
                .font(.headline)
            Text("$\(product.price)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Button(action: {
                cartManager.addToCart(product: product)
            }) {
                Text("Add to Cart")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
    }
}
struct ProductCard_Preview: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
