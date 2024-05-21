//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation

final class UniversitiesListWireFrame: UniversitiesListWireFrameProtocol
{
    
    func createModule() -> UniversitiesListViewProtocol
    {
        // Generating module components
        let view  = UniversitiesListView()
        let presenter = UniversitiesListPresenter()
        let interactor = UniversitiesListInteractor()
        let APIDataManager = UniversitiesAPIDataManager()
        let localDataManager = UniversitiesListLocalDataManager()
        let wireFrame = UniversitiesListWireFrame()
        
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
}
