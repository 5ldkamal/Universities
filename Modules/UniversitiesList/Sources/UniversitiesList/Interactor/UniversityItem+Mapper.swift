//
//  File.swift
//  
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation

import DomainLayer

extension UniversityItemModel {
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

extension UniversityItemModel {
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

