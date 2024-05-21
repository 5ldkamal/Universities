//
//  UniversitiesListPresenter+HandleResponse.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import DomainLayer
import Foundation

// MARK: - Handle response

extension UniversitiesListPresenter {
    /// Fetches universities for the specified country.
    ///
    /// - Parameter country: The country for which universities are to be fetched. Defaults to "United Arab Emirates".
    func fetchUniversities(country: String = "United Arab Emirates") {
        self.view?.startLoading()
        
        self.searchCountry = country
        
        self.interactor?.fetchUniversities(country: country)
    }
    
    /// Handles the successful response with the fetched universities.
    ///
    /// - Parameter items: An array of `UniversityItemModel` objects representing the fetched universities.
    func didSuccessUniversities(items: [UniversityItemModel]) {
        self.view?.stopLoading()
        
        self.universitiesViewModels = items.map { .init(universityItemModel: $0) }
        
        self.view?.reloadData()
    }
    
    /// Handles the failed response with an error.
    ///
    /// - Parameter error: The error received from the API.
    func didFailedUniversities(error: Error) {
        self.view?.stopLoading()
        
        self.view?.showError(error: error)
    }
    
    /// Handles the refresh of the universities list.
    func didRefreshList() {
        self.universitiesViewModels.removeAll()
        
        self.view?.reloadData()
    }
}
