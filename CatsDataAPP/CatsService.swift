//
//  CatService.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 8/21/23.
//


import Foundation
import Combine

class CatsService {
    var cancelable = Set<AnyCancellable>()
    let urlString = "https://647e1a94af984710854af0ac.mockapi.io/api/v1/Cats"
    
    func fetchCats() -> Future<[Cats], Error> {
        return Future<[Cats], Error> { promise in
            guard let url = URL(string: self.urlString) else {
                let error = NSError(domain: "invalidUrl", code: 0, userInfo: nil)
                promise(.failure(error))
                return
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: [Cats].self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished: break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }, receiveValue: { response in
                    promise(.success(response))
                })
                .store(in: &self.cancelable)
        }
    }
}
