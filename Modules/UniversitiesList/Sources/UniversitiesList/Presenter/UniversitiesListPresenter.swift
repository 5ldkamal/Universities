//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import DomainLayer
import Foundation

final class UniversitiesListPresenter: UniversitiesListPresenterProtocol, UniversitiesListInteractorOutputProtocol {
    weak var view: UniversitiesListViewProtocol?
    var interactor: UniversitiesListInteractorInputProtocol?
    var wireFrame: UniversitiesListWireFrameProtocol?

    /// The UI model representing the universities list.
    var universitiesViewModels = [UniversityItemViewModel]()

    func viewDidLoad() {
        fetchUniversities()
    }
}

// MARK: - DataSource

extension UniversitiesListPresenter {
    func numberOfItems() -> Int {
        return universitiesViewModels.count
    }

    func item(at index: IndexPath) -> UniversityItemViewModel? {
        return universitiesViewModels[index.row]
    }

    func didSelectItem(at index: IndexPath) {
        guard let item  = interactor?.university(at: index.row) else{
            return
        }
        print(item.name)
    }
}
