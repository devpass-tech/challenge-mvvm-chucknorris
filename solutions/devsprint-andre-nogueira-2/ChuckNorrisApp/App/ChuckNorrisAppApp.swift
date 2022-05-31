//
//  ChuckNorrisAppApp.swift
//  ChuckNorrisApp
//
//  Created by Rodrigo Borges on 18/05/22.
//

import SwiftUI

@main
struct ChuckNorrisAppApp: App {
    
    @StateObject var searchContext = SearchContext()
    
    var body: some Scene {
        WindowGroup {
            let content = ContentView()
            content.environmentObject(searchContext)
        }
    }
}
