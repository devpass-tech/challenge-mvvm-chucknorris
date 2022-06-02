//
//  CategoryListView.swift
//  ChuckNorrisApp
//
//  Created by Rodrigo Borges on 18/05/22.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject private var categoriesViewModel: CategoriesViewModel
    @ObservedObject private var searchViewModel: SearchViewModel
    
    @EnvironmentObject private var searchContext: SearchContext
    private let storage: SettingsStorage
    
    init(
        searchViewModel: SearchViewModel,
        categoriesViewModel: CategoriesViewModel,
        storage: SettingsStorage
    ) {
        self.searchViewModel = searchViewModel
        self.categoriesViewModel = categoriesViewModel
        self.storage = storage
    }
    
    var body: some View {
        VStack {
            List {
                Section(header: ListHeaderView()) {

                    ForEach(categoriesViewModel.categoriesArray,
                        id: \.self
                    ) { category in
                        Text(category).onTapGesture {
                            searchContext.searchText = category
                            storage.savePreferred(categorie: category)
                        }
                    }
                }
            }.listStyle(.plain)
        }
    }
}

struct ListHeaderView: View {
    var body: some View {
        HStack {
            Text("Select a category to search for it")
        }
    }
}
