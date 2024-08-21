//
//  Product.swift
//  Project
//
//  Created by Amritpal Gill on 2024-07-03.
//

import Foundation

//struct Product: Identifiable {
//    var id = UUID()
//    var name: String
//    var image: String
//    var price: Int
//}
//
//var productList = [Product(name: "Orange Swetaer", image: "sweater1", price: 54),
//                   Product(name: "Red Wine Swetaer", image: "sweater2", price: 89),
//                   Product(name: "Sand Swetaer", image: "sweater3", price: 79),
//                   Product(name: "Sea Swetaer", image: "sweater4", price: 94),
//                   Product(name: "Cream Swetaer", image: "sweater5", price: 99),
//                   Product(name: "Beige Swetaer", image: "sweater6", price: 65),
//                   Product(name: "Grey Swetaer", image: "sweater7", price: 54),
//                   Product(name: "Mink Swetaer", image: "sweater8", price: 83)]

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let price: Int
}

let productList1 = [
    Product(name: "Men's Sweater", image: "men", price: 50),
    Product(name: "one", image: "Men1", price: 69),
    Product(name: "two", image: "Men2", price: 55),
    Product(name: "three", image: "Men3", price: 39),
    Product(name: "fourth", image: "Men3", price: 75),
    Product(name: "fifth", image: "Men4", price: 79),
//    Product(name: "six", image: "Men5", price: 35),
    Product(name: "sevem", image: "Men6", price: 44),
    Product(name: "eight", image: "Men7", price: 56),
    Product(name: "nine", image: "Men8", price: 73),
    Product(name: "Sand Swetaer", image: "sweater3", price: 76),
    Product(name: "Cream Swetaer", image: "sweater5", price: 99),
    Product(name: "Beige Swetaer", image: "sweater6", price: 65)
    // Add more products
]
let productList2 = [
    Product(name: "kid", image: "kid1", price: 50),
    Product(name: "one", image: "kid2", price: 69),
    Product(name: "two", image: "kid3", price: 55),
    Product(name: "three", image: "kid4", price: 39),
    Product(name: "fourth", image: "kid5", price: 75),
    Product(name: "fifth", image: "kid6", price: 79),
//    Product(name: "six", image: "Men5", price: 35),
    Product(name: "seven", image: "kid7", price: 44),
    Product(name: "eight", image: "kid8", price: 56),
    Product(name: "nine", image: "kid9", price: 73),
    Product(name: "ten", image: "kid10", price: 76),
    Product(name: "eleven", image: "kid11", price: 99),
    Product(name: "twelve", image: "kid12", price: 65)
    // Add more products
]
let productList = [
    Product(name: "Orange Swetaer", image: "sweater1", price: 54),
    Product(name: "Red Wine Swetaer", image: "sweater2", price: 89),
    Product(name: "Sea Swetaer", image: "sweater4", price: 94),
    Product(name: "Grey Swetaer", image: "women", price: 54),
    Product(name: "Mink Swetaer", image: "sweater8", price: 83),
    Product(name: "one", image: "women1", price: 55),
    Product(name: "two", image: "women2", price: 45),
    Product(name: "three", image: "women3", price: 66),
    Product(name: "four", image: "women4", price: 34),
    Product(name: "five", image: "women5", price: 57),
    Product(name: "six", image: "women6", price: 77),
    Product(name: "seven", image: "women7", price: 60),
//    Product(name: "eight", image: "women8", price: 83)
    // Add more products
]
