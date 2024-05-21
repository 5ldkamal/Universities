//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation

public final class UniversityDetailsWireFrame: UniversityDetailsWireFrameProtocol {
    public static func createModule() -> UniversityDetailsViewProtocol? {
        // Generating module components
        let view: UniversityDetailsViewProtocol = UniversityDetailsView()
        let presenter = UniversityDetailsPresenter()
        let wireFrame: UniversityDetailsWireFrameProtocol = UniversityDetailsWireFrame()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame

        return view
    }
}
