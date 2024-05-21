//
//  UniversityItemDTOElement.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation

/// A data transfer object (DTO) representing a university item.
public struct UniversityItemDTOElement: Codable {
    /// The country where the university is located.
    let country: String
    /// An array of URLs of the university's web pages.
    let webPages: [String]
    /// The ISO 3166-1 alpha-2 country code.
    let alphaTwoCode: String
    /// An array of domains associated with the university.
    let domains: [String]
    /// The state or province where the university is located. Optional.
    let stateProvince: String?
    /// The name of the university.
    let name: String

    /// Enum to map JSON keys to struct properties.
    enum CodingKeys: String, CodingKey {
        case country
        case webPages = "web_pages"
        case alphaTwoCode = "alpha_two_code"
        case domains
        case stateProvince = "state-province"
        case name
    }
}
