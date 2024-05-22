//
//  UniversitiesListPresenter+UniversityDetailsDelegate.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation
import UniversityDetails

/// Extension to conform `UniversitiesListPresenter` to `UniversityDetailsDelegate` protocol.
extension UniversitiesListPresenter: UniversityDetailsDelegate {
    /// Refreshes the list view by fetching universities for the current search country.
    func refreshListView() {
        interactor?.refreshUniversities(country: searchCountry)
    }
}
