//
//  PaymentSuccessView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-13.
//

import SwiftUI

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
    }
}


