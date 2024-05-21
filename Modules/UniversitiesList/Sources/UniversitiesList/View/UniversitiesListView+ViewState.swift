//
//  File.swift
//  
//
//  Created by Khaled Kamal on 21/05/2024.
//

import Foundation
import LoaderView

extension UniversitiesListView {
    public func startLoading() {
        
        LoaderView.shared.showLoader(on: self)
    }
    
    public func stopLoading() {
        LoaderView.shared.dismissLoader()
    }
    
    public func showError(error: Error) {
        
    }
    
    public func reloadData() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }

    }
}
