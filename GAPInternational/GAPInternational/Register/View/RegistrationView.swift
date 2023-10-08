//
//  RegistrationView.swift
//  GAPInternational
//
//  Created by rakeshlohan on 05/10/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @ObservedObject var viewModel: RegistrationViewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                TextField(Constants.loginUsername, text: $viewModel.username)
                
                Divider()
                
                SecureField(Constants.loginPassword, text: $viewModel.password)
                    .padding(.top, 20)
                
                Divider()
            }
            
            Spacer()
            
            Button(
                action: {
                    viewModel.registerUser()
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
        .padding(30)
        .navigationBarTitle("Registration")
    }
}

