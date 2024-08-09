//
//  SignInEmailView.swift
//  ProjectApp
//
//  Created by Amritpal Gill on 2024-07-16.
//

//import SwiftUI
//
//@MainActor
//final class SignInEmailViewModel: ObservableObject {
//    @Published var email = ""
//    @Published var password = ""
//    
//    func signIn() async throws {
//        guard !email.isEmpty, !password.isEmpty else {
//            print("No email or password found.")
//            return
//        }
//        
//        Task{
//            do{
//                let returnedUserData = try await AutheticationManager.shared.createUser(email: email, password: password)
//                print("Success")
//                print(returnedUserData)
//            } catch{
//                print("Error: \(error)")
//            }
//        }
//        
//           }
//    
//}
//
//struct SignInEmailView: View {
//    
//    @StateObject private var viewModel = SignInEmailViewModel()
//    var body: some View {
//        VStack{
//            TextField("Email...", text: $viewModel.email)
//                .padding()
//                .background(Color.gray.opacity(0.4))
//                .cornerRadius(10)
//            
//            SecureField("Password...", text: $viewModel.password)
//                .padding()
//                .background(Color.gray.opacity(0.4))
//                .cornerRadius(10)
//            
//            Button{
//                viewModel.signIn()
//            }label: {
//                Text("Sign In ")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .frame(height: 55)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//            Spacer()
//        }
//        .padding()
//        .navigationTitle("Sign In with Eamil")
//    }
//}
//
//struct SignInEmailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack{
//            SignInEmailView()
//        }
//    }
//}
import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        
           try await AutheticationManager.shared.createUser(email: email, password: password)
            
            
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        
           try await AutheticationManager.shared.signInUser(email: email, password: password)
            
            
    }
}

//struct SignInEmailView: View {
//    @StateObject private var viewModel = SignInEmailViewModel()
//    @State private var errorMessage: String? = nil
//    @State private var isSignedIn = false
//    @Binding var showSignInView: Bool
//    var body: some View {
//        VStack {
//            NavigationLink(destination: ContentView(), isActive: $isSignedIn) {
//                            EmptyView()
//                        }
//            
//            TextField("Email...", text: $viewModel.email)
//                .padding()
//                .background(Color.gray.opacity(0.4))
//                .cornerRadius(10)
//            
//            SecureField("Password...", text: $viewModel.password)
//                .padding()
//                .background(Color.gray.opacity(0.4))
//                .cornerRadius(10)
//            
//            Button {
//                Task {
//                    do {
//                    try await viewModel.signUp()
//                    showSignInView = false
//                    return
//                    } catch {
//                    errorMessage = error.localizedDescription
//                    }
//                    do {
//                    try await viewModel.signIn()
//                    showSignInView = false
//                    return
//                    } catch {
//                    errorMessage = error.localizedDescription
//                    }
//            }
//            } label: {
//                Text("Sign In")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .frame(height: 55)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//            
//            if let errorMessage = errorMessage {
//                Text(errorMessage)
//                    .foregroundColor(.red)
//                    .padding()
//            }
//
//            Spacer()
//        }
//        .padding()
//        .navigationTitle("Sign In with Email")
//    }
//}

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @State private var errorMessage: String? = nil
    @State private var isSignedIn = false
    @Binding var showSignInView: Bool
    
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                TextField("Email...", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                Button {
                    Task {
                        do {
                            try await viewModel.signUp()
                            isSignedIn = true
                            showSignInView = false
                            navigationPath.append("ContentView")
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                        do {
                            try await viewModel.signIn()
                            isSignedIn = true
                            showSignInView = false
                            navigationPath.append("ContentView")
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                    }
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Sign In with Email")
            .navigationDestination(for: String.self) { value in
                if value == "ContentView" {
                    ContentView()
                }
            }
        }
    }
}
struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInEmailView(showSignInView: .constant(false))
        }
    }
}
