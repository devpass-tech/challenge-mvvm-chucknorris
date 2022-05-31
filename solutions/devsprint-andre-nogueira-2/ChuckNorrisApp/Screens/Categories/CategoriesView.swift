//
//  CategoryListView.swift
//  ChuckNorrisApp
//
//  Created by Rodrigo Borges on 18/05/22.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject private var categoriesViewModel: CategoriesViewModel
    @EnvironmentObject private var searchContext: SearchContext

    init(categoriesViewModel: CategoriesViewModel) {
        self.categoriesViewModel = categoriesViewModel
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
