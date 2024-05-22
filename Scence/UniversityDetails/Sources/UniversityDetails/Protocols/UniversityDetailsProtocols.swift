//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import Foundation

/// A protocol that defines the view for the university details screen.
public protocol UniversityDetailsViewProtocol: AnyObject {
    /// The presenter that handles the presentation logic for the view.
    var presenter: UniversityDetailsPresenterProtocol? { get set }

    /// Updates the view with the provided university details.
    /// - Parameter model: The university details view model.
    func updateView(model: UniversityDetailsViewModel)
}

/// A protocol that defines the wireframe for the university details screen.
public protocol UniversityDetailsRouterProtocol: AnyObject {
    /// Creates the university details module by initializing and connecting all its components.
    /// - Parameters:
    ///   - university: The university model object containing the details to be displayed.
    ///   - delegate: An optional delegate that conforms to the `UniversityDetailsDelegate` protocol.
    /// - Returns: An optional view protocol for the UniversityDetails view, which can be nil if the view cannot be created.
    static func createModule(university: UniversityItemModel,
                             delegate: UniversityDetailsDelegate?) -> UniversityDetailsViewProtocol?

    /// Pops the current view controller from the navigation stack.
    /// - Parameter animated: A Boolean value indicating whether the transition is to be animated.
    func pop(animated: Bool)
}

/// A protocol that defines the presenter for the university details screen.
public protocol UniversityDetailsPresenterProtocol: AnyObject {
    /// The view that the presenter is presenting data to.
    var view: UniversityDetailsViewProtocol? { get set }

    /// The wireframe that handles navigation and presentation.
    var wireFrame: UniversityDetailsRouterProtocol? { get set }

    /// Called when the view is loaded.
    func loadData()

    /// Refreshes the view by calling the wireframe to pop the current view controller and firing the delegate to refresh the list view.
    func refresh()
}
