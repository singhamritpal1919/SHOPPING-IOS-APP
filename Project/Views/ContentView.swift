//
//  ContentView.swift
//  Project
//
//  Created by Amritpal Gill on 2024-07-03.
//






import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()  // Shared CartManager instance

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Mens().environmentObject(cartManager)) {
                    CategoryButton(title: "Men", imageName: "men")
                }
                .background(.black)
                .cornerRadius(50)

                NavigationLink(destination: Womens().environmentObject(cartManager)) {
                    CategoryButton(title: "Women", imageName: "women")
                }
                .background(.black)
                .cornerRadius(50)

                NavigationLink(destination: Kids().environmentObject(cartManager)) {
                    CategoryButton(title: "Kids", imageName: "kid1")
                }
                .background(.black)
                .cornerRadius(50)

                Spacer()
            }
            .navigationTitle("Clothing App")
            .padding()
        }
    }
}


//import SwiftUI
//
//struct ContentView: View {
//    @StateObject var cartManager = CartManager()  // Shared CartManager instance
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(destination: Mens().environmentObject(cartManager)) {
//                    CategoryButton(title: "Men", imageName: "men")
//                }
//                .background(.black)
//                .cornerRadius(50)
//                
//                NavigationLink(destination: Womens().environmentObject(cartManager)) {
//                    CategoryButton(title: "Women", imageName: "women")
//                }
//                .background(.black)
//                .cornerRadius(50)
//                
//                NavigationLink(destination: Kids().environmentObject(cartManager)) {
//                    CategoryButton(title: "Kids", imageName: "kid1")
//                }
//                .background(.black)
//                .cornerRadius(50)
//                
//                Spacer()
//            }
//            .navigationTitle("Clothing App")
//            .padding()
//        }
//    }
//}
//
struct CategoryButton: View {
    let title: String
    let imageName: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(radius: 10)
        }
        .padding(.vertical, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//
//
//            
//    }
//}


