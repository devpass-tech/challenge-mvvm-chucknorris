//
//  CategoriesViewModel.swift
//  ChuckNorrisApp
//
//  Created by Appito on 26/05/22.
//

import SwiftUI
import Combine

protocol CategoriesViewModelContract: ObservableObject {
    
    func makeCategoriesRequest()
}

public class CategoriesViewModel: CategoriesViewModelContract {
    
    @Published private(set) var categoriesArray: [String] = []
    private let apiService: ApiService
    private var disposables = Set<AnyCancellable>()
    private let storage: SettingsStorage
    init(
        apiService: ApiService,
        settingsStorage: SettingsStorage
    ){
        self.apiService = apiService
        self.storage = settingsStorage
        makeCategoriesRequest()
    }
    
    func makeCategoriesRequest(){
        apiService.makeCategoriesRequest()
            .sink(
              receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.categoriesArray = ["Couldn't fetch categories. Try again later."]
                case .finished:
                    print("finished")
                  break
                }
              },
              receiveValue: { categories in
                  if categories.count > 0 {
                      self.categoriesArray = categories
                  } else {
                      self.categoriesArray = ["No categories to display."]
                  }
              })
            .store(in: &disposables)
    }
    
}
