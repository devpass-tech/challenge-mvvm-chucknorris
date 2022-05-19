//
//  CategoryListView.swift
//  ChuckNorrisApp
//
//  Created by Rodrigo Borges on 18/05/22.
//

import SwiftUI

struct CategoriesView: View {

    var categories = ["Animal", "Career", "Celebrity", "Dev"]

    var body: some View {
        VStack {
            List {
                Section(header: ListHeaderView()) {
                    ForEach(categories,
                        id: \.self
                    ) { category in
                        Text(category).onTapGesture {

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
