//
//  UniversitiesListPresenter.swift
//
//
//  Created by Khaled Kamal on 22/05/2024.
//

import Foundation
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
