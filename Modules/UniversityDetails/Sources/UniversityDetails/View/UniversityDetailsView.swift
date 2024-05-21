//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import UIKit

public final class UniversityDetailsView: UIViewController, UniversityDetailsViewProtocol {
    /// OUTLET
    @IBOutlet var universityNameLabel: UILabel?

    @IBOutlet var universityStateLabel: UILabel?

    @IBOutlet var countryNameLabel: UILabel?

    @IBOutlet var countryCodeLabel: UILabel?

    @IBOutlet var webPageLabel: UILabel!

    /// Properties
    public var presenter: UniversityDetailsPresenterProtocol?

    /// Methods
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.presenter?.viewDidLoad()

        self.setupNavigationBar()
    }

    private func setupNavigationBar() {
        let refreshButton = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(self.refreshButtonAction)
        )
        navigationItem.rightBarButtonItem = refreshButton
    }

    /// Action triggered when the refresh button is tapped.
    @objc private func refreshButtonAction() {
        self.presenter?.refresh()
    }
}

public extension UniversityDetailsView {
    func updateView(model: UniversityDetailsViewModel) {
        self.title = model.universityName

        self.universityNameLabel?.text = model.universityName
        self.universityStateLabel?.text = model.stateProvince
        self.countryNameLabel?.text = model.countryName
        self.countryCodeLabel?.text = model.countryCode
        self.webPageLabel.text = model.webPage
    }
}
