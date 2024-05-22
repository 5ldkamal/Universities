//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import UIKit
/// A view controller that displays details of a university.
///
/// This view controller is responsible for displaying the name, state, country, country code, and web page of a university. It conforms to the `UniversityDetailsViewProtocol` protocol and has a property called `presenter` of type `UniversityDetailsPresenterProtocol` for presenting data to the view.
///
/// The view controller has several outlets for UI labels (`UILabel`) that are used to display the university details. The `viewDidLoad()` method is overridden to perform some initialization tasks when the view is loaded. It calls the `viewDidLoad()` method of the presenter and sets up the navigation bar with a refresh button.
///
/// The `setupNavigationBar()` method creates a `UIBarButtonItem` with the refresh button style and sets it as the right bar button item of the navigation item.
///
/// The `refreshButtonAction()` method is triggered when the refresh button is tapped. It calls the `refresh()` method of the presenter.
///
/// The `updateView(model:)` method updates the UI labels with the data from the `UniversityDetailsViewModel` model.
public final class UniversityDetailsView: UIViewController, UniversityDetailsViewProtocol {
    /// OUTLET
    /// They should be 'private' if i do not use them in separated files
    @IBOutlet  var universityNameLabel: UILabel?

    @IBOutlet  var universityStateLabel: UILabel?

    @IBOutlet  var countryNameLabel: UILabel?

    @IBOutlet  var countryCodeLabel: UILabel?

    @IBOutlet  var webPageLabel: UILabel?

    /// Properties
    public var presenter: UniversityDetailsPresenterProtocol?

    /// Methods
    override public func viewDidLoad() {
        super.viewDidLoad()

        presenter?.loadData()

        setupNavigationBar()
    }

    private func setupNavigationBar() {
        let refreshButton = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(refreshButtonAction)
        )
        navigationItem.rightBarButtonItem = refreshButton
    }

    /// Action triggered when the refresh button is tapped.
    @objc private func refreshButtonAction() {
        presenter?.refresh()
    }
}

