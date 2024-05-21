//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import UIKit

public final class UniversityDetailsWireFrame: UniversityDetailsWireFrameProtocol {
    private weak var viewController: UIViewController?

    public static func createModule(university: UniversityItemModel, delegate: UniversityDetailsDelegate?) -> UniversityDetailsViewProtocol? {
        // Generating module components
        let view = UniversityDetailsView(nibName: "UniversityDetailsView", bundle: .module)
        let presenter = UniversityDetailsPresenter(university: university, delegate: delegate)

        let wireFrame = UniversityDetailsWireFrame()
        wireFrame.viewController = view
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame

        return view
    }

    public func pop(animated: Bool) {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: animated)
        }
    }
}
