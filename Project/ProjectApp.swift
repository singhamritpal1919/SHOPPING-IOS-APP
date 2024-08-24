//
//  ProjectApp.swift
//  Project
//
//  Created by Amritpal Gill on 2024-07-03.
//

import SwiftUI
import Firebase

@main
struct ProjectApp: App {
    
//    @StateObject private var transactionManager = TransactionManager()
    
    init() {
        FirebaseApp.configure()
        print("Configured Firebase!")
    }
    
    var body: some Scene {
        WindowGroup {
//            RootView()
            LoginView()
//                .environmentObject(transactionManager)
        }
    }
}
