//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation
import LoaderView

public extension UniversitiesListView {
    func startLoading() {
        LoaderView.shared.showLoader(on: self)
    }

    func stopLoading() {
        LoaderView.shared.dismissLoader()
    }

    func showError(error: Error) {
        LoaderView.shared.dismissLoader()
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}
