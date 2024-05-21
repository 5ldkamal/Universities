//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import Foundation




public protocol UniversitiesListViewProtocol: AnyObject
{
    var presenter: UniversitiesListPresenterProtocol? { get set }
    
    func startLoading()
    
    func stopLoading()
    
    func showError(error: Error)
    
    func reloadData()
}

public protocol UniversitiesListWireFrameProtocol: AnyObject
{
    static func  createModule() -> UniversitiesListViewProtocol
}

public protocol UniversitiesListPresenterProtocol: AnyObject
{
    var view: UniversitiesListViewProtocol? { get set }
    var interactor: UniversitiesListInteractorInputProtocol? { get set }
    var wireFrame: UniversitiesListWireFrameProtocol? { get set }

    func viewDidLoad()
    
    func numberOfItems() -> Int
    
    func item(at index: IndexPath) -> UniversityItemViewModel?
    
    func didSelectItem(at index: IndexPath)
}

public protocol UniversitiesListInteractorOutputProtocol: AnyObject
{
    func didSuccessUniversities(items: [UniversityItemModel])

    func didFailedUniversities(error: Error)
}

public protocol UniversitiesListInteractorInputProtocol: AnyObject
{
    var presenter: UniversitiesListInteractorOutputProtocol? { get set }
    var remoteDataManager: UniversitiesListAPIDataManagerInputProtocol? { get set }
    var localDatamanager: UniversitiesListLocalDataManagerInputProtocol? { get set }

    func fetchUniversities(country: String)
    
    func university(at index: Int)-> UniversityItemModel
}

public protocol UniversitiesDataManagerInputProtocol: AnyObject
{}

public protocol UniversitiesListAPIDataManagerInputProtocol
{
    func loadUniversities(
        country: String,
        completion: @escaping (Result<[UniversityItemDTOElement], Error>) -> Void
    )
}

public protocol UniversitiesListLocalDataManagerInputProtocol: AnyObject
{
    /// Saves universities list to local storage.
    /// - Parameters:
    ///   - list: The list of universities to be saved.
    ///   - completion: The completion block to be executed when the operation is completed.
    func saveUniversities(_ list: [UniversityItemRealm],
                          completion: @escaping (Result<Bool, Error>) -> Void)

    /// Fetches universities list from local storage.
    /// - Parameters:
    ///   - country: The country to fetch universities list for.
    ///   - completion: The completion block to be executed when the operation is completed.
    func fetchUniversities(country: String) -> [UniversityItemRealm]?

    /// Clears universities list from local storage.
    /// - Parameters:
    ///   - country: The country to clear universities list for.
    ///   - completion: The completion block to be executed when the operation is completed.
    func clearUniversities(country: String,
                           completion: @escaping (Result<Bool, Error>) -> Void)
}
