//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import DomainLayer
import UniversityDetails

/// The presenter class responsible for handling the presentation logic of the UniversitiesList module.
final class UniversitiesListPresenter: UniversitiesListPresenterProtocol, UniversitiesListInteractorOutputProtocol {
    weak var view: UniversitiesListViewProtocol?

    var interactor: UniversitiesListInteractorInputProtocol?
    var wireFrame: UniversitiesListWireFrameProtocol?

    /// The country for which universities are to be fetched.
    var searchCountry: String = "United Arab Emirates"

    /// The view models representing the universities list.
    var universitiesViewModels = [UniversityItemViewModel]()

    /// Called when the view is loaded.
    func viewDidLoad() {
        // Fetch universities for the specified country.
        fetchUniversities()
    }
}

// MARK: - DataSource

extension UniversitiesListPresenter {
    /// Returns the number of universities in the list.
    func numberOfItems() -> Int {
        return universitiesViewModels.count
    }

    /// Returns the view model for the university at the specified index.
    ///
    /// - Parameter index: The index of the university.
    /// - Returns: The view model for the university at the specified index.
    func item(at index: IndexPath) -> UniversityItemViewModel? {
        return universitiesViewModels[index.row]
    }

    /// Handles the selection of a university item.
    ///
    /// - Parameter index: The index of the selected university.
    func didSelectItem(at index: IndexPath) {
        guard let item = interactor?.university(at: index.row) else {
            return
        }
        // Open the UniversityDetails module for the selected university.
        wireFrame?.openUniversityDetails(university: item, delegate: self)
    }
}
