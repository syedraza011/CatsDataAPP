//
//  CatViewModel.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 8/21/23.
//

import Foundation
import Combine

class CatsViewModel: ObservableObject {
    @Published var allcats = [Cats]()
    let service = CatsService()
    
    func getCats() {
        service.fetchCats()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error): print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] cats in
                self?.allcats = cats
            })
    }
}

