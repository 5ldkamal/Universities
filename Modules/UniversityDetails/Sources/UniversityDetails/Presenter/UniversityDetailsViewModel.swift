//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import DomainLayer
import Foundation

/// A view model representing the details of a university.
public struct UniversityDetailsViewModel {
    let universityName: String
    let stateProvince: String?
    let countryName: String?
    let countryCode: String?
    let webPage: String?

    /// Initializes a new `UniversityDetailsViewModel` instance using the provided `UniversityItemModel`.
    ///
    /// - Parameter universityItemModel: The model containing the university details.
    init(universityItemModel: UniversityItemModel) {
        universityName = universityItemModel.name
        stateProvince = universityItemModel.stateProvince
        countryCode = universityItemModel.alphaTwoCode
        countryName = universityItemModel.country
        webPage = universityItemModel.webPages.first
    }
}
