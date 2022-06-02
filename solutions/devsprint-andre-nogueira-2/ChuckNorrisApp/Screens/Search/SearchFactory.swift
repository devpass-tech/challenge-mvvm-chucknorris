//
//  SearchFactory.swift
//  ChuckNorrisApp
//
//  Created by Andre Nogueira on 02.06.22.
//

import Foundation

struct SearchFactory {
    
    static func makeFactory() -> SearchView {
        let service = ApiService()
        let viewModel = SearchViewModel(service: service)
        let view = SearchView(viewModel: viewModel)
        return view
    }
}
