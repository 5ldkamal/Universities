//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import UIKit

final public class UniversitiesListView: UIViewController, UniversitiesListViewProtocol
{
    /// OUTLETS
    @IBOutlet var tableView: UITableView?
    
    /// Proprietors
    
    public var presenter: UniversitiesListPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
        setupTableView()
        
    }
}
