//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import StorageDBLayer

/// A local data manager responsible for managing university data storage and retrieval.
final class UniversitiesListLocalDataManager: UniversitiesListLocalDataManagerInputProtocol {
    /// The storage database used for saving and fetching university data.
    var storageDB: StorageDatabase = StorageDatabaseManager.sharedInstance

    /// Saves a list of university items to the local database.
    ///
    /// - Parameters:
    ///   - list: An array of `UniversityItemRealm` objects to be saved.
    ///   - completion: A completion handler that returns a `Result` indicating success or failure.
    func saveUniversities(_ list: [UniversityItemRealm],
                          completion: @escaping (Result<Bool, Error>) -> Void)
    {
        storageDB.save(objects: list, completion: completion)
    }

    /// Fetches universities from the local database based on the specified country.
    ///
    /// - Parameter country: The country for which universities are to be fetched.
    /// - Returns: An optional array of `UniversityItemRealm` objects, or `nil` if no universities are found.
    func fetchUniversities(country: String) -> [UniversityItemRealm]? {
        let predicate = NSPredicate(format: "country = %@", country)
        return storageDB.get(objectsWithQuery: UniversityItemRealm.self, predicate: predicate) as? [UniversityItemRealm]
    }

    /// Clears universities from the local database based on the specified country.
    ///
    /// - Parameters:
    ///   - country: The country for which universities are to be cleared.
    ///   - completion: A completion handler that returns a `Result` indicating success or failure.
    func clearUniversities(country: String,
                           completion: @escaping (Result<Bool, Error>) -> Void)
    {
        // Fetch the universities for the specified country.
        guard let universities = fetchUniversities(country: country) else {
            completion(.failure(StorageDatabaseError.databaseReadError))
            return
        }
        // Delete the fetched universities from the database.
        storageDB.delete(objects: universities, completion: completion)
    }
}
