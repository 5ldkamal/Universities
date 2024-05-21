//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation

public protocol UniversityDetailsViewProtocol: AnyObject {
    var presenter: UniversityDetailsPresenterProtocol? { get set }
}

public protocol UniversityDetailsWireFrameProtocol: AnyObject {
    static func createModule() -> UniversityDetailsViewProtocol?
}

public protocol UniversityDetailsPresenterProtocol: AnyObject {
    var view: UniversityDetailsViewProtocol? { get set }
    var wireFrame: UniversityDetailsWireFrameProtocol? { get set }
}
