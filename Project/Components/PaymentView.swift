//
//  PaymentView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-07.
//

//import SwiftUI
//
//struct PaymentView: View {
//    @EnvironmentObject var cartManager: CartManager
//    @State private var cardNumber: String = ""
//    @State private var expiryDate: String = ""
//    @State private var cvv: String = ""
//    @State private var isPaymentSuccessful: Bool = false
//    
//    var body: some View {
//        VStack {
//            Text("Payment Details")
//                .font(.largeTitle)
//                .padding()
//            
//            Form {
//                Section(header: Text("Card Information")) {
//                    TextField("Card Number", text: $cardNumber)
//                        .keyboardType(.numberPad)
//                    TextField("Expiry Date (MM/YY)", text: $expiryDate)
//                        .keyboardType(.numberPad)
//                    TextField("CVV", text: $cvv)
//                        .keyboardType(.numberPad)
//                }
//                HStack{
//                    Text("Your total amount")
//                    Spacer()
//                    Text("$\(cartManager.total).00")
//                        .bold()
//                    Button("Pay Now") {
//                        processPayment()
//                    }
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                    
//                }
//            }
//            if isPaymentSuccessful {
//                Text("Payment Successful!")
//                    .foregroundColor(.green)
//                    .font(.headline)
//                    .padding()
//            }
//        }
//        .navigationTitle("Payment")
//        .padding()
//    }
//    
//    private func processPayment() {
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            isPaymentSuccessful = true
//            
//            
//        }
//    }
//}
//
//struct PaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            PaymentView()
//                .environmentObject(CartManager())
//        }
//    }
//}

//import SwiftUI

//struct PaymentView: View {
//    @EnvironmentObject var cartManager: CartManager
//    @State private var cardNumber: String = ""
//    @State private var expiryDate: String = ""
//    @State private var cvv: String = ""
//    @State private var isPaymentSuccessful: Bool = false
//    
//    var body: some View {
//        VStack {
//            Text("Payment Details")
//                .font(.largeTitle)
//                .padding()
//            
//            Form {
//                Section(header: Text("Card Information")) {
//                    TextField("Card Number", text: $cardNumber)
//                        .keyboardType(.numberPad)
//                    TextField("Expiry Date (MM/YY)", text: $expiryDate)
//                        .keyboardType(.numberPad)
//                    TextField("CVV", text: $cvv)
//                        .keyboardType(.numberPad)
//                }
//                HStack{
//                    Text("Your total amount")
//                    Spacer()
//                    Text("$\(cartManager.total).00")
//                        .bold()
//                    NavigationLink(
//                        destination: PaymentSuccessView(lastFourDigits: String(cardNumber.suffix(4)), totalAmount: "$\(cartManager.total).00"),
//                        isActive: $isPaymentSuccessful
//                    ) {
//                        Button("Pay Now") {
//                            processPayment()
//                        }
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                    }
//                }
//            }
//        }
//        .navigationTitle("Payment")
//        .padding()
//    }
//    
//    private func processPayment() {
//        // Simulate a delay for payment processing
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            isPaymentSuccessful = true
//        }
//    }
//}
//
//struct PaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            PaymentView()
//                .environmentObject(CartManager())
//        }
//    }
//}
//

//import SwiftUI
//
//struct PaymentView: View {
//    @EnvironmentObject var cartManager: CartManager
//    @State private var cardNumber: String = ""
//    @State private var expiryDate: String = ""
//    @State private var cvv: String = ""
//    @State private var isPaymentSuccessful: Bool = false
//    @State private var navigateToSuccess: Bool = false
//    
//    var body: some View {
//        VStack {
//            Text("Payment Details")
//                .font(.largeTitle)
//                .padding()
//            
//            Form {
//                Section(header: Text("Card Information")) {
//                    TextField("Card Number", text: $cardNumber)
//                        .keyboardType(.numberPad)
//                    TextField("Expiry Date (MM/YY)", text: $expiryDate)
//                        .keyboardType(.numberPad)
//                    TextField("CVV", text: $cvv)
//                        .keyboardType(.numberPad)
//                }
//                HStack{
//                    Text("Your total amount")
//                    Spacer()
//                    Text("$\(cartManager.total).00")
//                        .bold()
//                    Button("Pay Now") {
//                        processPayment()
//                    }
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                }
//            }
//        }
//        .navigationTitle("Payment")
//        .padding()
//        .navigationDestination(isPresented: $navigateToSuccess) {
//            PaymentSuccessView(
//                lastFourDigits: String(cardNumber.suffix(4)),
//                totalAmount: "$\(cartManager.total).00"
//            )
//        }
//    }
//    
//    private func processPayment() {
//        // Simulate a delay for payment processing
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            navigateToSuccess = true
//        }
//    }
//}
//
//struct PaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            PaymentView()
//                .environmentObject(CartManager())
//        }
//    }
//}

//import SwiftUI
//
//struct PaymentView: View {
//    @EnvironmentObject var cartManager: CartManager
//    @State private var cardNumber: String = ""
//    @State private var expiryDate: String = ""
//    @State private var cvv: String = ""
//    @State private var isPaymentSuccessful: Bool = false
//    @State private var navigateToSuccess: Bool = false
//    
//    var body: some View {
//        VStack {
//            Text("Payment Details")
//                .font(.largeTitle)
//                .padding()
//            
//            Form {
//                Section(header: Text("Card Information")) {
//                    TextField("Card Number", text: $cardNumber)
//                        .keyboardType(.numberPad)
//                    TextField("Expiry Date (MM/YY)", text: $expiryDate)
//                        .keyboardType(.numberPad)
//                    TextField("CVV", text: $cvv)
//                        .keyboardType(.numberPad)
//                }
//                
//                HStack {
//                    Text("Your total amount")
//                    Spacer()
//                    Text("$\(cartManager.total).00")
//                        .bold()
//                }
//                .padding()
//                
//                NavigationLink(
//                    destination: PaymentSuccessView(
//                        lastFourDigits: String(cardNumber.suffix(4)),
//                        totalAmount: "$\(cartManager.total).00"
//                    ),
//                    isActive: $navigateToSuccess
//                ) {
//                    Button("Pay Now") {
//                        processPayment()
//                    }
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                }
//            }
//        }
//        .navigationTitle("Payment")
//        .padding()
//    }
//    
////    private func processPayment() {
////        // Simulate a delay for payment processing
////        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
////            if !cardNumber.isEmpty && !expiryDate.isEmpty && !cvv.isEmpty {
////                navigateToSuccess = true
////            } else {
////                // Handle the case where payment details are not filled in completely
////                print("Please fill in all payment details.")
////            }
////        }
////    }
//    
//    private func processPayment() {
//        // Check if all payment fields are filled in
//        if cardNumber.isEmpty {
//            print("Card Number is required.")
//            return
//        }
//        
//        if expiryDate.isEmpty {
//            print("Expiry Date is required.")
//            return
//        }
//        
//        if cvv.isEmpty {
//            print("CVV is required.")
//            return
//        }
//        
//        // Optionally, you can add more validation checks here, such as:
//        // - Card number length validation
//        // - Expiry date format validation
//        // - CVV length validation
//        
//        // Simulate a delay for payment processing
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            navigateToSuccess = true
//        }
//    }
//
//}
//
//struct PaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            PaymentView()
//                .environmentObject(CartManager())
//        }
//    }
//}

import SwiftUI

struct PaymentView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var navigateToSuccess: Bool = false
    
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack {
            NavigationLink(destination: TransactionHistoryView()) {
                Text("View Transaction History")
            }
            Text("Payment Details")
                .font(.largeTitle)
                .padding()
            
            Form {
                Section(header: Text("Card Information")) {
                    TextField("Card Number", text: $cardNumber)
                        .keyboardType(.numberPad)
                    TextField("Expiry Date (MM/YY)", text: $expiryDate)
                        .keyboardType(.numberPad)
                    TextField("CVV", text: $cvv)
                        .keyboardType(.numberPad)
                }
                
                HStack {
                    Text("Your total amount")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.bottom)
                }
                
                Button("Pay Now") {
                    processPayment()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .navigationTitle("Payment")
        .padding()
        .background(
            NavigationLink(destination: PaymentSuccessView(
                lastFourDigits: String(cardNumber.suffix(4)),
                totalAmount: "$\(cartManager.total).00"),
                           isActive: $navigateToSuccess) {
                EmptyView()
            }
        )
    }
    
    private func processPayment() {
        // Reset the error message
        errorMessage = nil
        
        // Check if all payment fields are filled in
        guard !cardNumber.isEmpty else {
            errorMessage = "Card Number is required."
            return
        }
        
        guard !expiryDate.isEmpty else {
            errorMessage = "Expiry Date is required."
            return
        }
        
        guard !cvv.isEmpty else {
            errorMessage = "CVV is required."
            return
        }
        
        // Debug output to confirm that the processPayment function is called
        print("Processing payment with card number: \(cardNumber)")
        
        // Simulate a delay for payment processing
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // If all fields are valid, navigate to the success page
            navigateToSuccess = true
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PaymentView()
                .environmentObject(CartManager())
        }
    }
}

