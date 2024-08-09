//
//  SettingView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-07-16.
//

import SwiftUI

@MainActor
final class SettingViewModel: ObservableObject {
    
    func signOut() throws {
        
        try AutheticationManager.shared.singhOut()
    }
    
    func resetPassword() async throws{
        let authUser = try AutheticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
            try await AutheticationManager.shared.resetPassword(email: email)
        
    }
}

struct SettingView: View {
    
    @StateObject private var viewModel = SettingViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
            
//            Button("Reset Password") {
//                Task {
//                    do {
//                        try await viewModel.resetPassword()
//                        print("Password Reset")
//                    } catch {
//                        print(error)
//                    }
//                }
//            }
            
        }
        .navigationTitle("Settings")
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(showSignInView: .constant(false))
    }
}

