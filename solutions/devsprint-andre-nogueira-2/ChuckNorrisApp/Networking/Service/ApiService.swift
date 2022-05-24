//
//  ApiService.swift
//  ChuckNorrisApp
//
//  Created by Fernando Duarte on 24/05/22.
//

import Moya
import Combine

protocol ApiServiceProtocol {
    func makeSearchRequest(query: String) -> AnyPublisher<SearchJokesModel, MoyaError>
}

final class ApiService {
    private let provider: MoyaProvider<ChuckNorrisApi> = MoyaProvider()
}

extension ApiService: ApiServiceProtocol {
    
    func makeSearchRequest(query: String) -> AnyPublisher<SearchJokesModel, MoyaError> {
        provider.requestPublisher(
            .search(query),
            callbackQueue: DispatchQueue.main
        ).map(SearchJokesModel.self)
    }    
}
