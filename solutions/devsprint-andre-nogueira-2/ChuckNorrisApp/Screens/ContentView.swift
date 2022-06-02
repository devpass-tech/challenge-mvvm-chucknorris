//
//  ContentView.swift
//  ChuckNorrisApp
//
//  Created by Rodrigo Borges on 18/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchFactory.makeFactory()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle")
                }

            RandomFactView()
                .tabItem {
                    Label("Random facts", systemImage: "dice")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
