//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

public struct InvalidURLError: LocalizedError {
    var url: URL?

    public var errorDescription: String? {
        "Invalid end url \(String(describing: url?.absoluteString))"
    }
}
