//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import Foundation

public final class UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    public weak var view: UniversityDetailsViewProtocol?
    
    public var wireFrame: UniversityDetailsWireFrameProtocol?
    
    private let university: UniversityItemModel
    
    private weak var delegate: UniversityDetailsDelegate?
    
    init(university: UniversityItemModel, delegate: UniversityDetailsDelegate?) {
        self.university = university
        self.delegate = delegate
    }
    
    public func viewDidLoad() {
        let mappingModel = UniversityDetailsViewModel(universityItemModel: university)
        view?.updateView(model: mappingModel)
    }
    
    public func refresh() {
        wireFrame?.pop(animated: true)
        
        /// Fire Delegate
        delegate?.refreshListView()
    }
}
