//
//  UniversityTableViewCell.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import UIKit

/// Custom table view cell to display university information.
final class UniversityTableViewCell: UITableViewCell {
    /// Reuse identifier for the cell.
    static let reuseIdentifier = String.init(describing: UniversityTableViewCell.self) //"UniversityTableViewCell"

    /// Label to display the university name.
    @IBOutlet var universityNameLabel: UILabel!

    /// Label to display the state/province of the university.
    @IBOutlet var universityStateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Configure cell appearance
        selectionStyle = .none
    }

    /// Configures the cell with the provided university data.
    ///
    /// - Parameter university: The view model representing the university data.
    func config(with university: UniversityItemViewModel) {
        universityNameLabel.text = university.name
        universityStateLabel.text = university.stateProvince
    }
}
