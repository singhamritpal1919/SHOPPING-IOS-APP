//
//  ProductCard.swift
//  Project
//
//  Created by Amritpal Gill on 2024-07-03.
//

import SwiftUI

struct ProductCard: View {
    
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(product.name)
                        .bold()
                    
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 100, height: 250)
            .shadow(radius: 3)
            
            Button{
                print("Added to cart")
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
            .offset(x: +47, y: -10) 
        }
    }
}

struct ProductCard_Preview: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
    }
}
