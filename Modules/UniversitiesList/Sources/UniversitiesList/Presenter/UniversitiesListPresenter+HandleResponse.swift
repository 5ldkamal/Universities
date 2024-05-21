//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import DomainLayer
import Foundation

// MAKE: - Handle response
extension UniversitiesListPresenter {
    func fetchUniversities(country: String = "United Arab Emirates") {
        self.view?.startLoading()
        
        self.searchCountry = country
        
        self.interactor?.fetchUniversities(country: country)
    }
    
    func didSuccessUniversities(items: [UniversityItemModel]) {
        self.view?.stopLoading()

        self.universitiesViewModels = items.map { .init(universityItemModel: $0) }
        
        self.view?.reloadData()
    }
    
    func didFailedUniversities(error: Error) {
        self.view?.stopLoading()
        self.view?.showError(error: error)
    }
    
    func didRefreshList() {
        
        self.universitiesViewModels.removeAll()
        
        self.view?.reloadData()
        
    }
}
