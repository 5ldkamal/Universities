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
    var wireFrame: UniversitiesListRouterProtocol?

    /// The country for which universities are to be fetched.
    var searchCountry: String = "United Arab Emirates"

    /// The view models representing the universities list.
    var universitiesViewModels = [UniversityItemViewModel]()

    /// Called when the view is loaded.
    func loadData() {
        // Fetch universities for the specified country.
        fetchUniversities()
    }
}

