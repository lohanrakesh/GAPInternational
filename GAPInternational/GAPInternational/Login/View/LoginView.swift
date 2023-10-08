//
//  LoginView.swift
//  GAPInternational
//
//  Created by rakeshlohan on 18/08/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    @State private var openHomeView = false
    @State private var openRegistrationView = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                VStack {
                    TextField(
                        Constants.loginUsername,
                        text: $viewModel.username
                    )
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20)
                    
                    Divider()
                    
                    SecureField(
                        Constants.loginPassword,
                        text: $viewModel.password
                    )
                    .padding(.top, 20)
                    
                    Divider()
                }
                
                Spacer()
                
                NavigationLink(destination: HomeView(),
                               isActive: $openHomeView) {
                    Button(
                        action: {
                            openHomeView = true
                        },
                        label: {
                            Text(Constants.loginLogin)
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    )
                }
                
                NavigationLink(destination: RegistrationView(),
                               isActive: $openRegistrationView) {
                    Button(
                        action: {
                            openRegistrationView = true
                        },
                        label: {
                            Text(Constants.loginRegister)
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    )
                }
            }
            .padding(30)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
