//
//  CategoriesFactory.swift
//  ChuckNorrisApp
//
//  Created by Appito on 27/05/22.
//

import Foundation

struct CategoriesFactory {
    
    func makeCategories() -> CategoriesView {
        let api = ApiService()
        let categoriesViewModel = CategoriesViewModel(apiService: api)
        let categoriesView = CategoriesView(categoriesViewModel: categoriesViewModel)
        return categoriesView
    }
}
