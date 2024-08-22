//
//  TransactionHistoryView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-13.
//

import SwiftUI
import FirebaseFirestore

//struct TransactionHistoryView: View {
//    @State private var transactions: [Transaction] = []
//    
//    var body: some View {
//        NavigationView {
//            List(transactions) { transaction in
//                VStack(alignment: .leading) {
//                    Text("Card ending in \(transaction.lastFourDigits)")
//                        .font(.headline)
//                    Text("Total Amount: \(transaction.totalAmount)")
//                        .font(.subheadline)
//                    Text("Date: \(transaction.timestamp.dateValue())")
//                        .font(.footnote)
//                        .foregroundColor(.gray)
//                }
//            }
//            .navigationTitle("Transaction History")
//            .onAppear {
//                fetchTransactionHistory()
//            }
//        }
//    }
//    
//    func fetchTransactionHistory() {
//        let db = Firestore.firestore()
//        
//        db.collection("transactions").order(by: "timestamp", descending: true).getDocuments { snapshot, error in
//            if let error = error {
//                print("Error fetching transactions: \(error.localizedDescription)")
//            } else if let snapshot = snapshot {
//                self.transactions = snapshot.documents.map { doc in
//                    Transaction(
//                        id: doc.documentID,
//                        lastFourDigits: doc["lastFourDigits"] as? String ?? "",
//                        totalAmount: doc["totalAmount"] as? String ?? "",
//                        date: doc["timestamp"] as? Timestamp ?? Timestamp()
//                    )
//                }
//            }
//        }
//    }
//}
//
//struct Transaction: Identifiable {
//    var id: String
//    var lastFourDigits: String
//    var totalAmount: String
//    var timestamp: Timestamp
//}
//

struct PaymentTransaction: Identifiable {
    var id: String
    var lastFourDigits: String
    var totalAmount: String
    var timestamp: Timestamp
}

struct TransactionHistoryView: View {
    @State private var transactions: [PaymentTransaction] = []
    
    var body: some View {
        NavigationView {
            List(transactions) { transaction in
                VStack(alignment: .leading) {
                    Text("Card ending in \(transaction.lastFourDigits)")
                        .font(.headline)
                    Text("Total Amount: \(transaction.totalAmount)")
                        .font(.subheadline)
                    Text("Date: \(transaction.timestamp.dateValue(), formatter: dateFormatter)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Transaction History")
            .onAppear {
                fetchTransactionHistory()
            }
        }
    }
    
    func fetchTransactionHistory() {
        let db = Firestore.firestore()
        
        db.collection("transactions").order(by: "timestamp", descending: true).getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching transactions: \(error.localizedDescription)")
            } else if let snapshot = snapshot {
                self.transactions = snapshot.documents.compactMap { doc in
                    guard let lastFourDigits = doc["lastFourDigits"] as? String,
                          let totalAmount = doc["totalAmount"] as? String,
                          let timestamp = doc["timestamp"] as? Timestamp else {
                        return nil
                    }
                    
                    return PaymentTransaction(
                        id: doc.documentID,
                        lastFourDigits: lastFourDigits,
                        totalAmount: totalAmount,
                        timestamp: timestamp
                    )
                }
            }
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
