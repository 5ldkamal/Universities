//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import UIKit

/// View controller displaying the list of universities.
final public class UniversitiesListView: UIViewController, UniversitiesListViewProtocol
{
    /// OUTLETS
    @IBOutlet var tableView: UITableView?
    
    /// Presenter responsible for handling view logic.
    public var presenter: UniversitiesListPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notify presenter that the view is loaded
        presenter?.loadData()
        
        // Setup table view
        setupTableView()
        
        ///It must not use free string like this , we should create file collecting free string in every module
        /// TODO: Move this string into separated file
        self.title = "Universities"
    }
}
