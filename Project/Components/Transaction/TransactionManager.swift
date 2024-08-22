//
//  TransactionManager.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-13.
//

import Foundation

class TransactionManager: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    init() {
        loadTransactions()
    }
    
    func addTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
        saveTransactions()
    }
    
    private func saveTransactions() {
        if let encoded = try? JSONEncoder().encode(transactions) {
            UserDefaults.standard.set(encoded, forKey: "transactions")
        }
    }
    
    private func loadTransactions() {
        if let savedTransactions = UserDefaults.standard.data(forKey: "transactions"),
           let decodedTransactions = try? JSONDecoder().decode([Transaction].self, from: savedTransactions) {
            transactions = decodedTransactions
        }
    }
}

