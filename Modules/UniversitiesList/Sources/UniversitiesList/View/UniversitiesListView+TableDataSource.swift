//
//  File.swift
//
//
//  Created by Khaled Kamal on 21/05/2024.
//

import UIKit

// MARK: - Setup TableView

extension UniversitiesListView {
    /// Sets up the table view data source, delegate, and registers the custom cell.
    func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        registerUniversityTableViewCell()
    }

    /// Registers the custom table view cell.
    private func registerUniversityTableViewCell() {
        let reuseIdentifier = UniversityTableViewCell.reuseIdentifier
        tableView?.register(
            UINib(nibName: reuseIdentifier, bundle: .module),
            forCellReuseIdentifier: reuseIdentifier
        )
    }
}

// MARK: - UITableViewDataSource

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

        // Configure cell with the item
        cell.config(with: item)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension UniversitiesListView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Notify presenter that a row is selected
        presenter?.didSelectItem(at: indexPath)
    }
}
