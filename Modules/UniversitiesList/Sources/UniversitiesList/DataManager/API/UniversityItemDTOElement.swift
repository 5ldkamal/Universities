//
//  File.swift
//  
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation

// MARK: - UniversityItemDTOElement

public struct UniversityItemDTOElement: Codable {
    let country: String
    let webPages: [String]
    let alphaTwoCode: String
    let domains: [String]
    let stateProvince: String?
    let name: String

    enum CodingKeys: String, CodingKey {
        case country
        case webPages = "web_pages"
        case alphaTwoCode = "alpha_two_code"
        case domains
        case stateProvince = "state-province"
        case name
    }
}
