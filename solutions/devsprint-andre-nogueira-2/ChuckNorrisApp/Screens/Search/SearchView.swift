//
//  CategoryListView.swift
//  ChuckNorrisApp
//
//  Created by Rodrigo Borges on 18/05/22.
//

import SwiftUI

struct SearchView: View {

    @State private var searchText: String = ""
    @State private var showingSettings = false
    @EnvironmentObject private var searchContext: SearchContext
    private var categoriesFactory = CategoriesFactory()

    private var searchFacts: [String] = ["Fact 1", "Fact 2", "Fact 3", "Fact 4", "Fact 5"]

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

                ForEach(searchFacts, id: \.self) { fact in
                    Text(fact)
                }
        }.onSubmit(of: .search) {

        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
