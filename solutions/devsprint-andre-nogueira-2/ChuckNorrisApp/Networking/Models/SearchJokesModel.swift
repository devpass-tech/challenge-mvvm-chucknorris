//
//  SearchJokesModel.swift
//  ChuckNorrisApp
//
//  Created by Fernando Duarte on 24/05/22.
//

import Foundation


struct SearchJokesModel: Decodable {
    let total: Int?
    let result: [Jokes]?
}

struct Jokes: Decodable {
    let categories: [String]?
    let created_at: String?
    let icon_url: String?
    let id: String?
    let updated_at: String?
    let url: String?
    let value: String?
}
