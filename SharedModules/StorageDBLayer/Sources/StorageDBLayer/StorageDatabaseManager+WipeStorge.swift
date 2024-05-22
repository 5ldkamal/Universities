//
//  StorageDatabaseManager+WipeStorge.swift
//  
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

extension StorageDatabaseManager {
    /// Deletes all stored objects from the database.
    ///
    /// - Parameter completion: The completion handler to be called after wiping the storage.
    public func wipeStorage(completion: StorageCompletionHandler) {
        write(objects: [], completion: completion, block: { realm, _ in
            realm.deleteAll()
        })
    }
}
