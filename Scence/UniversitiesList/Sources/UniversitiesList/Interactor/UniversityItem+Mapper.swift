//
//  UniversityItemModel.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation

import DomainLayer

/// Extension to initialize a `UniversityItemModel` from a `UniversityItemDTOElement`.
extension UniversityItemModel {
    /// Initializes a `UniversityItemModel` instance from a `UniversityItemDTOElement`.
    ///
    /// - Parameter universityListItem: The `UniversityItemDTOElement` from which to create the model.
    init(universityListItem: UniversityItemDTOElement) {
        self.init()
        name = universityListItem.name
        alphaTwoCode = universityListItem.alphaTwoCode
        country = universityListItem.country
        domains = universityListItem.domains
        webPages = universityListItem.webPages
        stateProvince = universityListItem.stateProvince
    }
}

/// Extension to initialize a `UniversityItemModel` from a `UniversityItemRealm`.
extension UniversityItemModel {
    /// Initializes a `UniversityItemModel` instance from a `UniversityItemRealm`.
    ///
    /// - Parameter universityListItem: The `UniversityItemRealm` from which to create the model.
    init(universityListItem: UniversityItemRealm) {
        self.init()
        name = universityListItem.name
        alphaTwoCode = universityListItem.alphaTwoCode
        country = universityListItem.country
        domains = Array(universityListItem.domains)
        webPages = Array(universityListItem.webPages)
        stateProvince = universityListItem.stateProvince
    }
}
