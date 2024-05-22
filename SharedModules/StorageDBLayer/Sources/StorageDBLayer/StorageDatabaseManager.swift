//
//  StorageDatabaseManager.swift
//  
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation
import RealmSwift
import Realm

/// Manager responsible for storage database operations.
public final class StorageDatabaseManager: NSObject, StorageDatabase {
    // MARK: - Variables
    
    /// Shared instance of `StorageDatabaseManager`.
    public static let sharedInstance = StorageDatabaseManager()
    
    /// A private queue for background tasks.
    private let backgroundQueue = DispatchQueue(label: "realm.background.queue", qos: .background)
    
    // MARK: - Init
    
    override init() {
        super.init()
        setupConfiguration()
    }
    
    /// Creates a new Realm instance.
    ///
    /// - Throws: An error if the Realm instance cannot be created.
    ///
    /// - Returns: A new Realm instance.
    func createRealm() throws -> Realm {
        try Realm(configuration: Realm.Configuration.defaultConfiguration)
    }
    
    private func setupConfiguration() {
        let config = Realm.Configuration(
            deleteRealmIfMigrationNeeded: true
        )
        
        Realm.Configuration.defaultConfiguration = config
    }
    
    /// Calls the completion handler on the main thread.
    ///
    /// - Parameters:
    ///   - result: The boolean value to pass to the completion handler or an Error.
    ///   - completion: The completion handler.
    
    func completionHandler(result:Result<Bool , Error>, completion: StorageCompletionHandler) {
        DispatchQueue.main.async {
            completion?(result)
        }
    }
}

extension StorageDatabaseManager {
    /// Writes a single object to the database.
    ///
    /// - Parameters:
    ///   - object: The object to write to the database.
    ///   - completion: The completion handler called after the write operation.
    ///   - block: A block called after the write operation with the Realm instance and the resolved object.
    func write(
        object: Object,
        completion: StorageCompletionHandler,
        block: @escaping ((Realm, Object) -> Void)
    ) {
        writeAsync(passedObject: object) { [weak self] result in
            switch result {
            case let .success((realm, resolveObject)):

                if let resolveObject = resolveObject {
                    block(realm, resolveObject)
                }
                
                self?.completionHandler(result: .success(resolveObject != nil), completion: completion)

            case .failure(let error):
                self?.completionHandler(result: .failure(error), completion: completion)
            }
        }
    }
    
    /// Writes an array of objects to the database.
    ///
    /// - Parameters:
    ///   - objects: The objects to write to the database.
    ///   - completion: The completion handler called after the write operation.
    ///   - block: A block called after the write operation with the Realm instance and the resolved objects.
    func write(
        objects: [Object],
        completion: StorageCompletionHandler,
        block: @escaping ((Realm, [Object]) -> Void)
    ) {
        writeAsync(passedObjects: objects) { [weak self] result in
            switch result {
            case let .success((realm, resolveObjects)):
                if let resolveObjects = resolveObjects {
                    block(realm, resolveObjects)
                }
                
                self?.completionHandler(result: .success(resolveObjects != nil),
                                        completion: completion)

            case .failure(let error):
                self?.completionHandler(result: .failure(error),
                                        completion: completion)
            }
        }
    }
}



// MARK: - Write on realm using backgroundQueue

extension StorageDatabaseManager {
    /// Asynchronously writes an array of thread-confined objects to the realm using a background queue.
    ///
    /// - Parameters:
    ///   - passedObjects: The array of thread-confined objects to write.
    ///   - completion: A completion handler that will be called with the result of the write operation.
    /// - Note: The completion handler is called on the main queue.
    private func writeAsync<T:Object>(passedObjects: [T],
                                               completion: @escaping (Result<(Realm, [T]?), Error>) -> Void)
    {
        // Perform the write operation on a background queue
        backgroundQueue.async {
            do {
                let realm = try self.createRealm()

                realm.refresh()

                try realm.write {
                    completion(.success((realm, passedObjects)))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }

    /**
     Asynchronously writes a single thread-confined object to the realm using a background queue.

     - Parameters:
        - passedObject: The thread-confined object to write.
        - completion: A completion handler that will be called with the result of the write operation.

     - Note: The completion handler is called on the main queue.
     */
    private func writeAsync<T: Object>(passedObject: T,
                                               completion: @escaping (Result<(Realm, T?), Error>) -> Void)
    {

        backgroundQueue.async {
            do {
                let realm = try self.createRealm()

                realm.refresh()

                try realm.write {
                    completion(.success((realm, passedObject)))
                }

            } catch {
                completion(.failure(error))
            }
        }
    }
}
