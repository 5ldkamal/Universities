//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import UIKit

extension UniversitiesListView {
    func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        registerUniversityTableViewCell()
    }

    private func registerUniversityTableViewCell() {
        let reuseIdentifier = UniversityTableViewCell.reuseIdentifier
        tableView?.register(
            UINib(nibName: reuseIdentifier, bundle: .module),
            forCellReuseIdentifier: reuseIdentifier
        )
    }
}

extension UniversitiesListView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = UniversityTableViewCell.reuseIdentifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UniversityTableViewCell,
              let item = presenter?.item(at: indexPath)
        else {
            return UITableViewCell()
        }
        
        cell.config(with: item)
        
        return cell
    }
}

extension UniversitiesListView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
}
