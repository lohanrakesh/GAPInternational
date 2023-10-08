//
//  RegistrationViewModel.swift
//  GAPInternational
//
//  Created by rakeshlohan on 05/10/23.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    var cancellables: Set<AnyCancellable> = []
    
    func registerUser() {
        APIManager.shared.fetchData(endpoint: "/api/User/CreateUserAccount", parameters: ["UserName": username, "Password": password])
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { responseData in
                debugPrint(responseData)
            })
            .store(in: &cancellables)
    }
}
