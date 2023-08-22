//
//  CatService.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 8/21/23.
//


import Foundation
import Combine

enum APIError: LocalizedError {
    
    case invalidURL(String)
}

class CatsService {
    
    func fetchCats() -> AnyPublisher<[CatsResponse], Error> {
        
        guard let url = URL(string: "https://647e1a94af984710854af0ac.mockapi.io/api/v1/Cats") else {
            return Fail(error: APIError.invalidURL("URL invalid"))
                .eraseToAnyPublisher()
        } // guard end
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [CatsResponse].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
}
        
