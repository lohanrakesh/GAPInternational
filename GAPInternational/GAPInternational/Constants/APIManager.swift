//
//  APIManager.swift
//  GAPInternational
//
//  Created by rakeshlohan on 06/10/23.
//

import Combine
import Foundation

class APIManager {
    static let shared = APIManager()
    
    private let baseURL = "https://gapinternationalwebapi20200521010239.azurewebsites.net"
    
    private init() { }
    
    func fetchData<T: Decodable>(endpoint: String, parameters: [String: String], responseType: T.Type) -> AnyPublisher<Data, Error> {
        var urlComponents = URLComponents(string: baseURL + endpoint)
                
                var queryItems: [URLQueryItem] = []
                for (key, value) in parameters {
                    queryItems.append(URLQueryItem(name: key, value: value))
                }
                
                urlComponents?.queryItems = queryItems
                
                guard let url = urlComponents?.url else {
                    return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
                }
            
            return URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: [Item].self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    
    func fetchData<T: Decodable>(endpoint: String, responseType: T.Type) -> AnyPublisher<T, Error> {
        let url = URL(string: baseURL + endpoint)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
