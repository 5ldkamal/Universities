//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import Foundation

/// A presenter class responsible for handling the presentation logic of the UniversityDetails module.
public final class UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    /// A weak reference to the view protocol to avoid retain cycles.
    public weak var view: UniversityDetailsViewProtocol?

    /// A reference to the wireframe protocol for navigation logic.
    public var wireFrame: UniversityDetailsRouterProtocol?

    /// The university model containing the details to be presented.
    private let university: UniversityItemModel

    /// A weak reference to the delegate to avoid retain cycles.
    private weak var delegate: UniversityDetailsDelegate?

    /// Initializes a new `UniversityDetailsPresenter` instance.
    ///
    /// - Parameters:
    ///   - university: The university model object containing the details to be presented.
    ///   - delegate: An optional delegate that conforms to the `UniversityDetailsDelegate` protocol.
    init(university: UniversityItemModel,
         delegate: UniversityDetailsDelegate?)
    {
        self.university = university
        self.delegate = delegate
    }

    /// Called when the view is loaded. Prepares the view with the university details.
    public func loadData() {
        let mappingModel = UniversityDetailsViewModel(universityItemModel: university)
        view?.updateView(model: mappingModel)
    }

    /// Refreshes the view by popping the current view controller and notifying the delegate.
    public func refresh() {
        wireFrame?.pop(animated: true)

        /// Notifies the delegate to refresh the list view.
        delegate?.refreshListView()
    }
}
