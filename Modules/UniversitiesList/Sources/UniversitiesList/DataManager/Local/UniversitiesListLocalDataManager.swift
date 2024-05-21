//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import StorageDBLayer

final class UniversitiesListLocalDataManager: UniversitiesListLocalDataManagerInputProtocol
{
    var storageDB: StorageDatabase = StorageDatabaseManager.sharedInstance
    
    func saveUniversities(_ list: [UniversityItemRealm], completion: @escaping (Result<Bool, Error>) -> Void) {
        storageDB.save(objects: list, completion: completion)
    }
    
    func fetchUniversities(country: String)-> [UniversityItemRealm]? {
        let predicate = NSPredicate(format: "country = %@", country)
        return storageDB.get(objectsWithQuery: UniversityItemRealm.self, predicate: predicate) as? [UniversityItemRealm]
    }
    
    func clearUniversities(country: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let universities = fetchUniversities(country: country) else {
            completion(.success(false))
            return 
        }
        storageDB.delete(objects: universities , completion: completion)
    }
}
