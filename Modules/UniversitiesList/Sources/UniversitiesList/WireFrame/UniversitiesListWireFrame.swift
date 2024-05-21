//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import UIKit
import UniversityDetails
import DomainLayer

public final class UniversitiesListWireFrame: UniversitiesListWireFrameProtocol
{
    
    private var viewController: UIViewController?
    
    public static func createModule() -> UniversitiesListViewProtocol
    {
        // Generating module components
        let view = UniversitiesListView(nibName: "UniversitiesListView", bundle: .module)
        let presenter = UniversitiesListPresenter()
        let interactor = UniversitiesListInteractor()
        let APIDataManager = UniversitiesAPIDataManager()
        
        let localDataManager = UniversitiesListLocalDataManager()
        let wireFrame = UniversitiesListWireFrame()
        wireFrame.viewController = view

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDataManager = APIDataManager
        interactor.localDatamanager = localDataManager

        return view
    }
    
    public func openUniversityDetails(university: UniversityItemModel,
                               delegate: UniversityDetailsDelegate?){
        
        guard let details = UniversityDetailsWireFrame.createModule(university: university, delegate: delegate) as? UIViewController else{
            print("View Not Found")
            return
        }
        self.viewController?.navigationController?.pushViewController(details,
                                                                      animated: true)
    }
}
