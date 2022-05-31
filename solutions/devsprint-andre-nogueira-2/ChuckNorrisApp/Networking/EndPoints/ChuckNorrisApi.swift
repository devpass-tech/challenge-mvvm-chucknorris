//
//  ApiService.swift
//  ChuckNorrisApp
//
//  Created by Fernando Duarte on 23/05/22.
//

import Moya

public enum ChuckNorrisApi {
    case search(String)
    case random
    case categories
}

extension ChuckNorrisApi: TargetType {
    public var baseURL: URL { URL(string: "https://api.chucknorris.io")! }
    public var path: String {
        switch self {
        case .search:
            return "/jokes/search"
        case .random:
            return "/jokes/random"
        case .categories:
            return "/jokes/categories"
        }
    }
    public var method: Moya.Method { .get }
    
    public var task: Task {
        switch self {
        case .search(let query):
            return .requestParameters(parameters: ["query": query], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    public var headers: [String: String]? { nil }
    
}
