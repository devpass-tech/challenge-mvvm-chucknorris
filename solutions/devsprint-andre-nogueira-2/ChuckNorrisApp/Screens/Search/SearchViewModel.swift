//
//  SearchViewModel.swift
//  ChuckNorrisApp
//
//  Created by Andre Nogueira on 02.06.22.
//

import Foundation
import Combine

protocol SearchViewModelProtocol: ObservableObject {
    func makeSearchRequest(with query: String)
}

class SearchViewModel: SearchViewModelProtocol {
    
    private let service: ApiService
    @Published private(set) var jokesArray:[String] = []
    private var setAnyCancellable = Set<AnyCancellable>()
    
    init(service: ApiService){
        self.service = service
    }
    
    func makeSearchRequest(with query: String) {
        
        service
            .makeSearchRequest(query: query)
            .sink { result in
                switch result {
                case .finished: break
                case .failure(let error): break
                }
            } receiveValue: { [weak self] jokesModel in
                self?.jokesArray = jokesModel.result?.compactMap { $0.value } ?? []
            }.store(in: &setAnyCancellable)

    }
    
    
}
