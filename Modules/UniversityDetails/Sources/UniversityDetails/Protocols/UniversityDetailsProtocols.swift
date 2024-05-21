//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import DomainLayer

public protocol UniversityDetailsViewProtocol: AnyObject {
    var presenter: UniversityDetailsPresenterProtocol? { get set }
    
    func updateView(model: UniversityDetailsViewModel)
}

public protocol UniversityDetailsWireFrameProtocol: AnyObject {
    static func createModule(university: UniversityItemModel, delegate: UniversityDetailsDelegate?) -> UniversityDetailsViewProtocol?
    
    func pop(animated: Bool)
}

public protocol UniversityDetailsPresenterProtocol: AnyObject {
    var view: UniversityDetailsViewProtocol? { get set }
    var wireFrame: UniversityDetailsWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
}
