//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation

import DomainLayer

public struct UniversityItemViewModel {
    let name: String
    let stateProvince: String?

    init(universityItemModel: UniversityItemModel) {
        self.name = universityItemModel.name
        self.stateProvince = universityItemModel.stateProvince
    }
}
