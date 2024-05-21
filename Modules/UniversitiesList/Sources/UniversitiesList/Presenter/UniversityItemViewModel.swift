///
//  UniversityItemViewModel.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import DomainLayer
import Foundation

/// A view model representing a university item for display purposes.
public struct UniversityItemViewModel {
    /// The name of the university.
    let name: String
    /// The state or province of the university, if available.
    let stateProvince: String?

    /// Initializes a `UniversityItemViewModel` from a `UniversityItemModel`.
    ///
    /// - Parameter universityItemModel: The model containing university details.
    init(universityItemModel: UniversityItemModel) {
        self.name = universityItemModel.name
        self.stateProvince = universityItemModel.stateProvince
    }
}
