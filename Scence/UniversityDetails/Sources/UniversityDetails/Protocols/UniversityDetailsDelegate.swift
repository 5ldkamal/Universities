//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation

public protocol UniversityDetailsDelegate: AnyObject {
    /// Refreshes the list view.
    ///
    /// This method is called to inform the delegate that the list view needs to be refreshed.
    /// Implementations of this method should update the UI to reflect any changes in the data source.
    func refreshListView()
}
