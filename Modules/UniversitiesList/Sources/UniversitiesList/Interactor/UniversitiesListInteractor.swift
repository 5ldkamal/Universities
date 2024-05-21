//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import DomainLayer

final class UniversitiesListInteractor: UniversitiesListInteractorInputProtocol
{
    weak var presenter: UniversitiesListInteractorOutputProtocol?
    
    var remoteDataManager: UniversitiesListAPIDataManagerInputProtocol?
    var localDatamanager: UniversitiesListLocalDataManagerInputProtocol?
    
    
    func fetchUniversities(country: String){
        remoteDataManager?.loadUniversities(country: country,
                                            completion: { [weak self] result in
            switch result {
            case .success(let universities):
                let domainList = universities.map({UniversityItemModel(universityListItem: $0)})
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
        
        let realmObjects : [UniversityItemRealm] = universities.map({UniversityItemRealm(universityItemModel: $0)})
        
        localDatamanager?.saveUniversities(realmObjects, completion: {_ in})
        
        self.presenter?.didSuccessUniversities(items: universities)
    }
    
    private func handleFailure(country: String , error: Error) {
        
        if let localUniversities = localDatamanager?.fetchUniversities(country: country) {
            
            /// Map from DB to Business Model
            let list = localUniversities.map({UniversityItemModel(universityListItem:$0)})
            
            self.presenter?.didSuccessUniversities(items: list)
            
        }else{
            self.presenter?.didFailedUniversities(error: error)
        }
    }
}
