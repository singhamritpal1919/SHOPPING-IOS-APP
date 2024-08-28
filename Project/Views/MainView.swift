//
//  MainView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-07-10.
//

import SwiftUI

struct MainView: View {
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        TabView {
            Mens()
                .environmentObject(cartManager)
                .tabItem {
                    Label("Mens", systemImage: "person.fill")
                }
            
            Sweater()
                .environmentObject(cartManager)
                .tabItem {
                    Label("Sweater", systemImage: "tshirt.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
