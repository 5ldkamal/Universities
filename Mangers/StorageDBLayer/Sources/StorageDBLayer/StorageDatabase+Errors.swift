//
//  StorageDatabaseError.swift
//  
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

/// Errors related to storage database operations.
public enum StorageDatabaseError: LocalizedError {
    /// The database was not found.
    case databaseNotFound
    
    /// Unable to access the database.
    case unableToAccessDatabase
    
    /// Error occurred while reading from the database.
    case databaseReadError
    
    /// Error occurred while writing to the database.
    case databaseWriteError
}

