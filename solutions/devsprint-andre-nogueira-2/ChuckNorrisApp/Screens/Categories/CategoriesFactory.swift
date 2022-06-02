//
//  CategoriesFactory.swift
//  ChuckNorrisApp
//
//  Created by Appito on 27/05/22.
//

import Foundation

struct CategoriesFactory {
    
    static func makeCategories() -> CategoriesView {
        let api = ApiService()
        let storage = SettingsStorage()
        let searchViewModel = SearchViewModel(service: api)
        let categoriesViewModel = CategoriesViewModel(apiService: api, settingsStorage: storage)
        let categoriesView = CategoriesView(
            searchViewModel: searchViewModel,
            categoriesViewModel: categoriesViewModel,
            storage: storage)
        return categoriesView
    }
}
