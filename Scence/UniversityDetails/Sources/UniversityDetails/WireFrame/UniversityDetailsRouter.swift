//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import UIKit

/// A wireframe class responsible for managing the navigation logic and the creation
/// of the UniversityDetails module.
public final class UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    /// A weak reference to the view controller to avoid retain cycles.
    private weak var viewController: UIViewController?

    /// Creates the UniversityDetails module by initializing and connecting all its components.
    ///
    /// - Parameters:
    ///   - university: The university model object containing the details to be displayed.
    ///   - delegate: An optional delegate that conforms to the `UniversityDetailsDelegate` protocol.
    /// - Returns: An optional view protocol for the UniversityDetails view, which can be nil if the view cannot be created.
    public static func createModule(university: UniversityItemModel, delegate: UniversityDetailsDelegate?) -> UniversityDetailsViewProtocol? {
        let id = String(describing: UniversityDetailsView.self)
        let view = UniversityDetailsView(nibName: id, bundle: .module)

        let presenter = UniversityDetailsPresenter(university: university, delegate: delegate)

        let wireFrame = UniversityDetailsRouter()
        wireFrame.viewController = view

        view.presenter = presenter

        presenter.view = view

        presenter.wireFrame = wireFrame

        return view
    }

    /// Pops the current view controller from the navigation stack.
    ///
    /// - Parameter animated: A Boolean value indicating whether the transition is to be animated.
    public func pop(animated: Bool) {
        // Ensure the pop action is performed on the main thread.
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: animated)
        }
    }
}
