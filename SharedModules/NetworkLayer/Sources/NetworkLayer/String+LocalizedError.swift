//
//  File.swift
//
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
