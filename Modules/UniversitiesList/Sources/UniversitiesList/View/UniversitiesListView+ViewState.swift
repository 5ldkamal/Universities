//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation
import LoaderView

public extension UniversitiesListView {
    /// Shows loading indicator.
    func startLoading() {
        LoaderView.shared.showLoader(on: self)
    }

    /// Dismisses loading indicator.
    func stopLoading() {
        LoaderView.shared.dismissLoader()
    }

    /// Dismisses loading indicator in case of an error.
    ///
    /// - Parameter error: The error that occurred.
    func showError(error: Error) {
        LoaderView.shared.dismissLoader()
    }

    /// Reloads the table view data.
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}
