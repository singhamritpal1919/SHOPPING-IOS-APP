////
////  CartView.swift
////  Project
////
////  Created by Amritpal Gill on 2024-07-04.
////
//

import SwiftUI

struct CartView: View {
    
    @State private var showPaymentView: Bool = true
    @State private var showSignInView: Bool = false
    @StateObject private var settingViewModel = SettingViewModel() 
    
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack{
            NavigationLink(destination: TransactionHistoryView()) {
                Text("View Transaction History")
            }
            .bold()
            
            ScrollView {
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("Your total cart is")
                        Spacer()
                        Text("$\(cartManager.total).00")
                            .bold()
                    }
                    .padding()
                    
                    //                PaymentButton(action: {})
                    //                    .padding()
                    
                    
                    
                    //                    PaymentButton(action: {
                    //                        NavigationLink(<#LocalizedStringKey#>, destination: PaymentView()
                    //                            .environmentObject(cartManager))
                    //                    })
                    //                    .padding()
                    
                    NavigationLink(destination: PaymentView()
                        .environmentObject(cartManager)) {
                            Text("Proceed to Payment")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(10)
                                .padding()
                        }
                    
                } else {
                    
                        
                        Text("Your cart is empty")
                    }
                    
                
            }
            .navigationTitle(Text("My Cart"))
            .padding(.top)
            .toolbar {
                Button(action: {
                    signOut()
                }) {
                    Text("Sign Out")
                        .foregroundColor(.red)
                }
            }
            .fullScreenCover(isPresented: $showSignInView) {
                SignInView(showAuthenticationView: .constant(true))
            }
        }
    }
    func signOut() {
        Task {
            do {
                try settingViewModel.signOut()
                showSignInView = true
            } catch {
                print("Failed to sign out: \(error)")
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
