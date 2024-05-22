//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import UIKit
import UniversityDetails
import DomainLayer

/// Wireframe responsible for creating and presenting modules related to universities list.
public final class UniversitiesListWireFrame: UniversitiesListWireFrameProtocol
{
    private weak var viewController: UIViewController?
    
    /// Creates and configures the module for displaying the list of universities.
    ///
    /// - Returns: The view controller conforming to `UniversitiesListViewProtocol`.
    public static func createModule() -> UniversitiesListViewProtocol
    {
        // Generating module components
        let view = UniversitiesListView(nibName: "UniversitiesListView", bundle: .module)
        let presenter = UniversitiesListPresenter()
        let interactor = UniversitiesListInteractor()
        let APIDataManager = UniversitiesAPIDataManager()
        let localDataManager = UniversitiesListLocalDataManager()
        let wireFrame = UniversitiesListWireFrame()
        
        // Setting up dependencies
        wireFrame.viewController = view
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDataManager = APIDataManager
        interactor.localDatamanager = localDataManager

        return view
    }
    
    /// Navigates to the university details module.
    ///
    /// - Parameters:
    ///   - university: The university item model to be displayed.
    ///   - delegate: The delegate for handling actions in the university details module.
    public func openUniversityDetails(university: UniversityItemModel,
                               delegate: UniversityDetailsDelegate?){
        guard let details = UniversityDetailsWireFrame.createModule(university: university, delegate: delegate) as? UIViewController else{
            print("View Not Found")
            return
        }
        // Push the university details view controller onto the navigation stack
        self.viewController?.navigationController?.pushViewController(details,
                                                                      animated: true)
    }
}
