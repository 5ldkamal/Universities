//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import Foundation
import UniversityDetails

/// Protocol defining the view interface for the Universities List.
public protocol UniversitiesListViewProtocol: AnyObject {
    var presenter: UniversitiesListPresenterProtocol? { get set }

    /// Starts the loading indicator.
    func startLoading()

    /// Stops the loading indicator.
    func stopLoading()

    /// Displays an error message.
    ///
    /// - Parameter error: The error to be displayed.
    func showError(error: Error)

    /// Reloads the data in the view.
    func reloadData()
}

/// Protocol defining the wireframe interface for the Universities List.
public protocol UniversitiesListWireFrameProtocol: AnyObject {
    /// Creates the module for Universities List.
    ///
    /// - Returns: The view protocol for Universities List.
    static func createModule() -> UniversitiesListViewProtocol

    /// Opens the University Details screen.
    ///
    /// - Parameters:
    ///   - university: The university item model.
    ///   - delegate: The delegate for university details.
    func openUniversityDetails(university: UniversityItemModel,
                               delegate: UniversityDetailsDelegate?)
}

/// Protocol defining the presenter interface for the Universities List.
public protocol UniversitiesListPresenterProtocol: AnyObject {
    var view: UniversitiesListViewProtocol? { get set }
    var interactor: UniversitiesListInteractorInputProtocol? { get set }
    var wireFrame: UniversitiesListWireFrameProtocol? { get set }

    /// Called when the view is loaded.
    func viewDidLoad()

    /// Returns the number of items in the list.
    ///
    /// - Returns: The number of items.
    func numberOfItems() -> Int

    /// Returns the item at the specified index.
    ///
    /// - Parameter index: The index path of the item.
    /// - Returns: The university item view model.
    func item(at index: IndexPath) -> UniversityItemViewModel?

    /// Called when an item is selected.
    ///
    /// - Parameter index: The index path of the selected item.
    func didSelectItem(at index: IndexPath)
}

/// Protocol defining the interactor output interface for the Universities List.
public protocol UniversitiesListInteractorOutputProtocol: AnyObject {
    /// Called when universities are successfully fetched.
    ///
    /// - Parameter items: The list of university items.
    func didSuccessUniversities(items: [UniversityItemModel])

    /// Called when there is an error fetching universities.
    ///
    /// - Parameter error: The error that occurred.
    func didFailedUniversities(error: Error)

    /// Called when the list is refreshed.
    func didRefreshList()
}

/// Protocol defining the interactor input interface for the Universities List.
public protocol UniversitiesListInteractorInputProtocol: AnyObject {
    var presenter: UniversitiesListInteractorOutputProtocol? { get set }
    var remoteDataManager: UniversitiesListAPIDataManagerInputProtocol? { get set }
    var localDatamanager: UniversitiesListLocalDataManagerInputProtocol? { get set }

    /// Fetches universities for the specified country.
    ///
    /// - Parameter country: The country to fetch universities for.
    func fetchUniversities(country: String)

    /// Returns the university item at the specified index.
    ///
    /// - Parameter index: The index of the university.
    /// - Returns: The university item model.
    func university(at index: Int) -> UniversityItemModel

    /// Refreshes the list of universities for the specified country.
    ///
    /// - Parameter country: The country to refresh universities for.
    func refreshUniversities(country: String)
}

/// Protocol defining the data manager input interface for the Universities List.
public protocol UniversitiesDataManagerInputProtocol: AnyObject {}

/// Protocol defining the API data manager input interface for the Universities List.
public protocol UniversitiesListAPIDataManagerInputProtocol {
    /// Loads universities from the API for the specified country.
    ///
    /// - Parameters:
    ///   - country: The country to load universities for.
    ///   - completion: The completion handler with the result.
    func loadUniversities(
        country: String,
        completion: @escaping (Result<[UniversityItemDTOElement], Error>) -> Void
    )
}

/// Protocol defining the local data manager input interface for the Universities List.
public protocol UniversitiesListLocalDataManagerInputProtocol: AnyObject {
    /// Saves universities list to local storage.
    ///
    /// - Parameters:
    ///   - list: The list of universities to be saved.
    ///   - completion: The completion block to be executed when the operation is completed.
    func saveUniversities(_ list: [UniversityItemRealm],
                          completion: @escaping (Result<Bool, Error>) -> Void)

    /// Fetches universities list from local storage.
    ///
    /// - Parameter country: The country to fetch universities list for.
    /// - Returns: The list of universities for the specified country.
    func fetchUniversities(country: String) -> [UniversityItemRealm]?

    /// Clears universities list from local storage.
    ///
    /// - Parameters:
    ///   - country: The country to clear universities list for.
    ///   - completion: The completion block to be executed when the operation is completed.
    func clearUniversities(country: String,
                           completion: @escaping (Result<Bool, Error>) -> Void)
}
