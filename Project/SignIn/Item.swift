//
//  Item.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-07-16.
//

import Foundation

struct Item:Identifiable,Codable{
    var id: String = UUID().uuidString
    var name : String
    var description : String
}
