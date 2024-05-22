//
//  UniversitiesListInteractorTests.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import DomainLayer
@testable import UniversitiesList
import XCTest

final class UniversitiesListInteractorTests: XCTestCase {}

 //MARK: - Test fetching from remote  and local
extension UniversitiesListInteractorTests {
    private class RemoteApiAPIDataManagerSTUB: UniversitiesListAPIDataManagerInputProtocol {
        var result: Result<[UniversitiesList.UniversityItemDTOElement], Error>
        
        init(result: Result<[UniversitiesList.UniversityItemDTOElement], Error>) {
            self.result = result
        }
        
        func loadUniversities(country: String, completion: @escaping (Result<[UniversitiesList.UniversityItemDTOElement], Error>) -> Void) {
            completion(result)
        }
    }
    
    private class LocalApiAPIDataManagerSTUB: UniversitiesListLocalDataManagerInputProtocol {
        var cachedItems: [UniversitiesList.UniversityItemRealm]?
        
        func saveUniversities(_ list: [UniversitiesList.UniversityItemRealm], completion: @escaping (Result<Bool, Error>) -> Void) {}
        
        func fetchUniversities(country: String) -> [UniversitiesList.UniversityItemRealm]? {
            return cachedItems
        }
        
        func clearUniversities(country: String, completion: @escaping (Result<Bool, Error>) -> Void) {}
    }
    
    private func getBusinessModel() -> [UniversityItemDTOElement] {
        var list: [UniversityItemDTOElement] = []
        (1 ... 4).forEach { i in
            list.append(.init(country: "country\(i)",
                              webPages: [],
                              alphaTwoCode: "alphaTwoCode\(i)",
                              domains: [],
                              stateProvince: "stateProvince\(i)",
                              name: "name\(i)"))
        }
        return list
    }
    
    private func getCachedModel() -> [UniversityItemRealm] {
        let business =  getBusinessModel().map({UniversityItemModel.init(universityListItem: $0)})
        let realmObjects = business.map({UniversityItemRealm.init(universityItemModel: $0)})
        return realmObjects
    }
    
    private class PresenterSpy: UniversitiesListInteractorOutputProtocol {
        var error: Error?
        var universityItemModels: [UniversityItemModel]?
        
        func didSuccessUniversities(items: [DomainLayer.UniversityItemModel]) {
            universityItemModels = items
        }
        
        func didFailedUniversities(error: Error) {
            self.error = error
        }
        
        func didRefreshList() {}
    }
    
    func test_fetchUniversities_success_remote_success_caching() {
        // Given
        let interactor = UniversitiesListInteractor()
        
        /// Remote
        let listDataModel = getBusinessModel()
        let remoteDataManager = RemoteApiAPIDataManagerSTUB(result: .success(listDataModel))
        interactor.remoteDataManager = remoteDataManager
        
        /// Local
        let cachedItems: [UniversityItemRealm] = []
        let localDatamanager = LocalApiAPIDataManagerSTUB()
        localDatamanager.cachedItems = cachedItems
        interactor.localDatamanager = localDatamanager
        
        /// Presenter
        let presenterSpy = PresenterSpy()
        interactor.presenter = presenterSpy
        
        // When
        interactor.fetchUniversities(country: "")
        
        /// Then
        XCTAssertNotNil(presenterSpy.universityItemModels)
        XCTAssertNil(presenterSpy.error)
        
        XCTAssertEqual(listDataModel.count, presenterSpy.universityItemModels?.count)
    }
    
    func test_fetchUniversities_failure_remote_failure_caching() {
        // Given
        let interactor = UniversitiesListInteractor()
        
        /// Remote
        let remoteDataManager = RemoteApiAPIDataManagerSTUB(result: .failure("Error while fetching data from remote"))
        interactor.remoteDataManager = remoteDataManager
        
        /// Local
        let cachedItems: [UniversityItemRealm]? = nil
        let localDatamanager = LocalApiAPIDataManagerSTUB()
        localDatamanager.cachedItems = cachedItems
        interactor.localDatamanager = localDatamanager
        
        /// Presenter
        let presenterSpy = PresenterSpy()
        interactor.presenter = presenterSpy
        
        // When
        interactor.fetchUniversities(country: "")
        
        /// Then
        XCTAssertNil(presenterSpy.universityItemModels)
        XCTAssertNotNil(presenterSpy.error)
    }
    
    func test_fetchUniversities_failure_remote_success_caching() {
        // Given
        let interactor = UniversitiesListInteractor()
        
        /// Remote
        let remoteDataManager = RemoteApiAPIDataManagerSTUB(result: .failure("Error while fetching data from remote"))
        interactor.remoteDataManager = remoteDataManager
        
        /// Local
        let cachedItems: [UniversityItemRealm]? = getCachedModel()
        let localDatamanager = LocalApiAPIDataManagerSTUB()
        localDatamanager.cachedItems = cachedItems
        interactor.localDatamanager = localDatamanager
        
        /// Presenter
        let presenterSpy = PresenterSpy()
        interactor.presenter = presenterSpy
        
        // When
        interactor.fetchUniversities(country: "")
        
        /// Then
        XCTAssertNotNil(presenterSpy.universityItemModels)
        XCTAssertNil(presenterSpy.error)
        
        XCTAssertEqual(cachedItems?.count, presenterSpy.universityItemModels?.count)
    }
    
    func test_fetchUniversities_success_remote_failure_caching() {
        // Given
        let interactor = UniversitiesListInteractor()
        
        /// Remote
        let listDataModel = getBusinessModel()
        let remoteDataManager = RemoteApiAPIDataManagerSTUB(result: .success(listDataModel))
        interactor.remoteDataManager = remoteDataManager
        
        /// Local
        let cachedItems: [UniversityItemRealm]? = nil
        let localDatamanager = LocalApiAPIDataManagerSTUB()
        localDatamanager.cachedItems = cachedItems
        interactor.localDatamanager = localDatamanager
        
        /// Presenter
        let presenterSpy = PresenterSpy()
        interactor.presenter = presenterSpy
        
        // When
        interactor.fetchUniversities(country: "")
        
        /// Then
        XCTAssertNotNil(presenterSpy.universityItemModels)
        XCTAssertNil(presenterSpy.error)
        
        XCTAssertEqual(listDataModel.count, presenterSpy.universityItemModels?.count)
    }
}

//MARK: - Test saving process
extension UniversitiesListInteractorTests { 
    
    private class LocalSavingDataManagerSTUB: UniversitiesListLocalDataManagerInputProtocol {
        var cachedItems: [UniversitiesList.UniversityItemRealm]?
        
        func saveUniversities(_ list: [UniversitiesList.UniversityItemRealm], completion: @escaping (Result<Bool, Error>) -> Void) {
            self.cachedItems =  list
        }
        
        func fetchUniversities(country: String) -> [UniversitiesList.UniversityItemRealm]? {
            return cachedItems
        }
        
        func clearUniversities(country: String, completion: @escaping (Result<Bool, Error>) -> Void) {}
    }
    
    
    func test_saving_is_called() {
            // Given
            let interactor = UniversitiesListInteractor()
            
            /// Remote
            let listDataModel = getBusinessModel()
            let remoteDataManager = RemoteApiAPIDataManagerSTUB(result: .success(listDataModel))
            interactor.remoteDataManager = remoteDataManager
            
            /// Local
            let localDatamanager = LocalSavingDataManagerSTUB()
            interactor.localDatamanager = localDatamanager
            
            /// Presenter
            let presenterSpy = PresenterSpy()
            interactor.presenter = presenterSpy
            
            // When
            interactor.fetchUniversities(country: "")
            
            /// Then
            XCTAssertNotNil(presenterSpy.universityItemModels)
            XCTAssertNil(presenterSpy.error)
            
        XCTAssertEqual(localDatamanager.cachedItems?.count, presenterSpy.universityItemModels?.count)
        
        XCTAssertEqual(localDatamanager.cachedItems?.first?.name, presenterSpy.universityItemModels?.first?.name)
        
    }
}
