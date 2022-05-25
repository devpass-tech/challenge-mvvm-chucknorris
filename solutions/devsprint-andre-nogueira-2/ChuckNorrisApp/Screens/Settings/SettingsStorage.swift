//
//  SettingsStorage.swift
//  ChuckNorrisApp
//
//  Created by Pedro Boga on 24/05/22.
//

import Foundation

struct SettingsStorage {    
    private let versionKey: String = "version"
    private let preferredKey: String = "preferred"
    
    func getVersion() -> String {
        guard let version = UserDefaults.standard.string(forKey: versionKey) else {
            UserDefaults.standard.set("1.0.0", forKey: versionKey)
            return UserDefaults.standard.string(forKey: versionKey) ?? ""
        }
        return version
    }
    
    func getPreferred() -> String {
        guard let preferred = UserDefaults.standard.string(forKey: preferredKey) else {
            return ""
        }
        return preferred
    }
}
