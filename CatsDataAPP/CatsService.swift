//
//  CatService.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 8/21/23.
//

import Foundation
import Combine

class CatsService {
    var cancelable = Set<AnyCancelable>()
     let urlString = "https://647e1a94af984710854af0ac.mockapi.io/api/v1/Cats"
    func fetchCats()->Future<[Cats], Error> {
        return Future<[Cats], Error> { promise in
            guard let url = URL(string: urlString) else {
                let error = NSError(Domain: "invalidUrl", code: 0, catInfo: nil)
            promise (error)
                return
            }
            urlSession.shared.dataTaskPublisher(for: url)
                .map{$0.data}
                .decode(type: [Cats])
                .receive(on: mainQueue)
                .sink(receieveCompletion: { completion in
                    switch completion {
                    case .finished: break
                    case .failure ( let error): print(error.LocalizedError)
                        
                    }
                    
                }, recieveValue : { response in
                    promise(.sucess(response))
                })
                .store(in: &cancelable)
        }
    }
}
