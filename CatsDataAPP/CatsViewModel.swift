//
//  CatViewModel.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 8/21/23.
//
import Foundation
import Combine

class CatsViewModel: ObservableObject {
    let service = CatsService()
    @Published var allCats = [CatsResponse]()
    @Published var state: AsyncState = .initial

    var cancellables: Set<AnyCancellable> = []

    func getCats() {
        state = .loading
        self.service.fetchCats()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print("Fetch Failed: \(err.localizedDescription)")
                   
                }
            }, receiveValue: { [weak self] response in
               
                self?.allCats = response
            })
            .store(in: &cancellables)
    }
}




