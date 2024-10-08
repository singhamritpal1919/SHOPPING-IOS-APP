//
//  CartButton.swift
//  Project
//
//  Created by Amritpal Gill on 2024-07-04.
//

import SwiftUI

//struct CartButton: View {
//    var numberOfProducts: Int
//    
//    var body: some View {
//        ZStack(alignment: .topTrailing){
//            Image(systemName: "cart")
//                .padding(.top, 5)
//            
//            if numberOfProducts > 0 {
//                Text("\(numberOfProducts)")
//                    .font(.caption2).bold()
//                    .foregroundColor(.white)
//                    .frame(width: 15,height: 15)
//                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
//                    .cornerRadius(50)
//            }
//        }
//    }
//}
//
//struct CartButton_Preview: PreviewProvider {
//    static var previews: some View {
//        CartButton(numberOfProducts: 1)
//    }
//}

struct CartButton: View {
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart")
                .padding(.top, 5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15,height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }
    }
}
