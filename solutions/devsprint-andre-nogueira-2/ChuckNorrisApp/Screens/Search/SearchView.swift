//
//  CategoryListView.swift
//  ChuckNorrisApp
//
//  Created by Rodrigo Borges on 18/05/22.
//

import SwiftUI

struct SearchView: View {

    @State private var showingSettings = false
    @EnvironmentObject private var searchContext: SearchContext
    private var categoriesFactory = CategoriesFactory()
    @ObservedObject private var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            categoriesFactory.makeCategories()
                .navigationTitle("Search")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Settings") {
                            
                            showingSettings.toggle()
                        }.sheet(isPresented: $showingSettings,
                                onDismiss: {


                                }) {

                             SettingsView()
                         }
                    }
                }
        }.searchable(text: $searchContext.searchText,
                     placement: .navigationBarDrawer(displayMode: .always)) {

            ForEach(viewModel.jokesArray, id: \.self) { fact in
                    Text(fact)
                }
        }.onSubmit(of: .search) {
            viewModel.makeSearchRequest(with: searchContext.searchText)
        }
    }
}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
