//
//  LoginViewModel.swift
//  GAPInternational
//
//  Created by rakeshlohan on 18/08/23.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""

    func login() {}
}
