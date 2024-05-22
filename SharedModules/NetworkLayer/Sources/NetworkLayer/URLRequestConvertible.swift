//
//  dd.swift
//  NetworkLayer
//
// Created by Khaled Kamal on 20/05/2024.
//

import Foundation

/// Types adopting the `URLRequestConvertible` protocol can be used to safely construct `URLRequest`s.
public protocol URLRequestConvertible {
    /// Returns a `URLRequest` or throws if an `Error` was encountered.
    ///
    /// - Returns: A `URLRequest`.
    /// - Throws:  Any error thrown while constructing the `URLRequest`.
    func asURLRequest() throws -> URLRequest
}

public extension URLRequestConvertible {
    /// The `URLRequest` returned by discarding any `Error` encountered.
    var urlRequest: URLRequest? { try? asURLRequest() }
}
