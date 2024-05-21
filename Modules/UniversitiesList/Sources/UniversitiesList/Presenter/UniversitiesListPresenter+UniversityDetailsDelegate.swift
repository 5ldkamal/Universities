//
//  File.swift
//  
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation
import UniversityDetails

extension UniversitiesListPresenter: UniversityDetailsDelegate {
    func refreshListView() {
        interactor?.refreshUniversities(country: searchCountry)
    }
}
