//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import Foundation

/// The interactor responsible for handling business logic for the UniversitiesList module.
final class UniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
    weak var presenter: UniversitiesListInteractorOutputProtocol?
    
    var remoteDataManager: UniversitiesListAPIDataManagerInputProtocol?
    var localDatamanager: UniversitiesListLocalDataManagerInputProtocol?
    
    private var universities = [UniversityItemModel]()
    
    /// Fetches universities for the specified country.
    ///
    /// - Parameter country: The country for which universities are to be fetched.
    func fetchUniversities(country: String) {
        remoteDataManager?.loadUniversities(country: country,
                                            completion: { [weak self] result in
                                                switch result {
                                                case .success(let universities):
                                                    let domainList = universities.map { UniversityItemModel(universityListItem: $0) }
                                                    self?.handleSuccessWith(universities: domainList)
                
                                                case .failure(let failure):
                                                    self?.handleFailure(country: country, error: failure)
                                                }
                                            })
    }
}

// MARK: - Handle response

extension UniversitiesListInteractor {
    /// Handles the success response from the API.
    ///
    /// - Parameter universities: An array of `UniversityItemModel` objects representing the fetched universities.
    private func handleSuccessWith(universities: [UniversityItemModel]) {
        self.universities = universities
        
        let realmObjects: [UniversityItemRealm] = universities.map { UniversityItemRealm(universityItemModel: $0) }
        
        localDatamanager?.saveUniversities(realmObjects, completion: { _ in })
        
        presenter?.didSuccessUniversities(items: universities)
    }
    
    /// Handles the failure response from the API.
    ///
    /// - Parameters:
    ///   - country: The country for which universities were requested.
    ///   - error: The error received from the API.
    private func handleFailure(country: String, error: Error) {
        if let localUniversities = localDatamanager?.fetchUniversities(country: country) {
            /// Map from DB to Business Model
            let list = localUniversities.map { UniversityItemModel(universityListItem: $0) }
            
            universities = list
            
            presenter?.didSuccessUniversities(items: list)
            
        } else {
            presenter?.didFailedUniversities(error: error)
        }
    }
}


// MARK: - Pickup the University
extension UniversitiesListInteractor {
    /// Returns the university at the specified index.
    ///
    /// - Parameter index: The index of the university.
    /// - Returns: The `UniversityItemModel` at the specified index.
    func university(at index: Int) -> UniversityItemModel {
        return universities[index]
    }
}

// MARK: - Handle refreshing 
extension UniversitiesListInteractor {
    /// Refreshes the list of universities for the specified country.
    ///
    /// - Parameter country: The country for which universities are to be refreshed.
    func refreshUniversities(country: String) {
        universities = []
        
        presenter?.didRefreshList()
        
        localDatamanager?.clearUniversities(country: country, completion: { result in
            switch result {
            case .success:
                self.fetchUniversities(country: country)
                
            case .failure(let failure):
                self.presenter?.didFailedUniversities(error: failure)
            }
        })
    }
}
