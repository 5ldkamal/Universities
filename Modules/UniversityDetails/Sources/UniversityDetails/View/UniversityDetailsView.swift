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
    }
}
