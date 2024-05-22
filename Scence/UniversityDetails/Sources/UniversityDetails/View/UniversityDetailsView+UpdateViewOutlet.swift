//
//  File.swift
//  
//
//  Created by Khaled Kamal on 22/05/2024.
//

import Foundation

public extension UniversityDetailsView {
    /// Updates the UI labels with the data from the `UniversityDetailsViewModel` model.
    ///
    /// - Parameter model: The `UniversityDetailsViewModel` model containing the university details.
    func updateView(model: UniversityDetailsViewModel) {
        title = model.universityName

        universityNameLabel?.text = model.universityName
        universityStateLabel?.text = model.stateProvince
        countryNameLabel?.text = model.countryName
        countryCodeLabel?.text = model.countryCode
        webPageLabel?.text = model.webPage
    }
}
