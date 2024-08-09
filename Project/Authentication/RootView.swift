//
//  RootView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-07-16.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                SettingView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authuser = try? AutheticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authuser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
