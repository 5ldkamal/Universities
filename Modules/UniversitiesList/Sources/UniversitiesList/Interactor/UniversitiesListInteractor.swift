//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import Foundation

final class UniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
    weak var presenter: UniversitiesListInteractorOutputProtocol?
    
    var remoteDataManager: UniversitiesListAPIDataManagerInputProtocol?
    var localDatamanager: UniversitiesListLocalDataManagerInputProtocol?
    
    private var universities = [UniversityItemModel]()
    
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

// MAKK: - Handle response
extension UniversitiesListInteractor {
    private func handleSuccessWith(universities: [UniversityItemModel]) {
        self.universities = universities
        
        let realmObjects: [UniversityItemRealm] = universities.map { UniversityItemRealm(universityItemModel: $0) }
        
        localDatamanager?.saveUniversities(realmObjects, completion: { _ in })
        
        presenter?.didSuccessUniversities(items: universities)
    }
    
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

extension UniversitiesListInteractor {
    func university(at index: Int) -> UniversityItemModel {
        return universities[index]
    }
}

extension UniversitiesListInteractor {
    func refreshUniversities(country: String) {
        universities = []
        
        localDatamanager?.clearUniversities(country: country, completion: { result in
            switch result {
            case .success:
                
                self.presenter?.didSuccessUniversities(items: [])
                
                self.fetchUniversities(country: country)
            case .failure(let failure):
                self.presenter?.didFailedUniversities(error: failure)
            }
        })
    }
}
