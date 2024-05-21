//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import DomainLayer
import Foundation

public struct UniversityDetailsViewModel {
    let universityName: String
    let stateProvince: String?
    let countryName: String?
    let countryCode: String?
    let webPage: String?

    init(universityItemModel:
        UniversityItemModel)
    {
        self.universityName = universityItemModel.name
        self.stateProvince = universityItemModel.stateProvince
        self.countryCode = universityItemModel.alphaTwoCode
        self.countryName = universityItemModel.country
        self.webPage = universityItemModel.webPages.first
    }
}
