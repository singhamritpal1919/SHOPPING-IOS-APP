//
//  PaymentSuccessView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-13.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct PaymentSuccessView: View {
    var lastFourDigits: String
    var totalAmount: String
    
    var body: some View {
        VStack {
            Text("Payment Successful!")
                .font(.largeTitle)
                .foregroundColor(.green)
                .padding()
            
            Text("Thank you for your purchase!")
                .font(.headline)
                .padding()
            
            Text("Card ending in \(lastFourDigits)")
                .font(.subheadline)
                .padding()
            
            Text("Total Amount: \(totalAmount)")
                .font(.subheadline)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Success")
        .onAppear {
                    saveTransaction(lastFourDigits: lastFourDigits, totalAmount: totalAmount)
                }
    }
    
    
    func saveTransaction(lastFourDigits: String, totalAmount: String) {
        let db = Firestore.firestore()
        
        let transactionData: [String: Any] = [
            "timestamp": Timestamp(),
            "lastFourDigits": lastFourDigits,
            "totalAmount": totalAmount
        ]
        
        db.collection("transactions").addDocument(data: transactionData) { error in
            if let error = error {
                print("Error saving transaction: \(error.localizedDescription)")
            } else {
                print("Transaction saved successfully!")
            }
        }
    }
}

//import SwiftUI
//
//struct PaymentSuccessView: View {
//    var lastFourDigits: String
//    var totalAmount: String
//    
//    @EnvironmentObject var transactionManager: TransactionManager
//    
//    var body: some View {
//        VStack {
//            Text("Payment Successful!")
//                .font(.largeTitle)
//                .foregroundColor(.green)
//                .padding()
//            
//            Text("Thank you for your purchase!")
//                .font(.headline)
//                .padding()
//            
//            Text("Card ending in \(lastFourDigits)")
//                .font(.subheadline)
//                .padding()
//            
//            Text("Total Amount: \(totalAmount)")
//                .font(.subheadline)
//                .padding()
//            
//            Spacer()
//        }
//        .navigationTitle("Success")
//        .onAppear {
//            let transaction = Transaction(lastFourDigits: lastFourDigits, totalAmount: totalAmount, date: Date())
//            transactionManager.addTransaction(transaction)
//        }
//    }
//}




