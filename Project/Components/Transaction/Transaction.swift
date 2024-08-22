//
//  Transaction.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-13.
//

import Foundation

struct Transaction: Identifiable, Codable {
    var id = UUID()
    var lastFourDigits: String
    var totalAmount: String
    var date: Date
}
