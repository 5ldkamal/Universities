//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import DomainLayer

final class UniversitiesListPresenter: UniversitiesListPresenterProtocol, UniversitiesListInteractorOutputProtocol
{
    func didSuccessUniversities(items: [DomainLayer.UniversityItemModel]) {
    }
    
    func didFailedUniversities(error: Error) {
    }
    
    weak var view: UniversitiesListViewProtocol?
    var interactor: UniversitiesListInteractorInputProtocol?
    var wireFrame: UniversitiesListWireFrameProtocol?
    
    init() {}
}
