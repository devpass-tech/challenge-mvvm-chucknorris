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
    func makeRandomRequest() -> AnyPublisher<RandomModel, MoyaError>
    func makeCategoriesRequest() -> AnyPublisher<[String], MoyaError>
}

final class ApiService {
    private let provider: MoyaProvider<ChuckNorrisApi> = MoyaProvider()
}

extension ApiService: ApiServiceProtocol {
    
    func makeRandomRequest() -> AnyPublisher<RandomModel, MoyaError> {
        provider.requestPublisher(
            .random,
            callbackQueue: DispatchQueue.main
        ).map(RandomModel.self)
    }

    func makeCategoriesRequest() -> AnyPublisher<[String], MoyaError> {
        provider.requestPublisher(
            .categories,
            callbackQueue: DispatchQueue.main
        ).map([String].self)
    }

    func makeSearchRequest(query: String) -> AnyPublisher<SearchJokesModel, MoyaError> {
        provider.requestPublisher(
            .search(query),
            callbackQueue: DispatchQueue.main
        ).map(SearchJokesModel.self)
    }
}
