//
//  UniversityTableViewCell.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import UIKit

final class UniversityTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "UniversityTableViewCell"
    
    @IBOutlet var universityNameLabel: UILabel!
    @IBOutlet var universityStateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func config(with university: UniversityItemViewModel) {
        universityNameLabel.text = university.name
        universityStateLabel.text =  university.stateProvince
    }
}
