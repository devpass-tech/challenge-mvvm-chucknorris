//
//  SettingsViewModel.swift
//  ChuckNorrisApp
//
//  Created by Pedro Boga on 31/05/22.
//

import Foundation

class SettingsViewModel: ObservableObject {
    private let userDefaults = SettingsStorage()
    
    func getVersion() -> String {
        return userDefaults.getVersion()
    }
    
    func getPreferred() -> String {
        return userDefaults.getPreferred()
    }
    
    func savePreferred(categorie: String) {
        userDefaults.savePreferred(categorie: categorie)
    }
    
}
