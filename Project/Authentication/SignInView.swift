//
//  SignInView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-08-07.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var showAuthenticationView: Bool
    var body: some View {
        VStack {
            Text("You Are Signed Out")
                .font(.largeTitle)
                .padding()

//            NavigationLink(destination: AuthenticationView(showSignInView: $showAuthenticationView), isActive: $showAuthenticationView) {
//                Text("Sign In Again")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .frame(height: 55)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//                    .padding()
//            }
        }
//        .navigationTitle("Signed Out")
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(showAuthenticationView: .constant(true))
    }
}

