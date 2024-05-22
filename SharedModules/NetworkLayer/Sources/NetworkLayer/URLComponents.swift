//
//  URLComponents.swift
//  NetworkLayer
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

public protocol URLBuilderProtocol {
    var url: URL? { get }
}

/// Build the http url
public struct URLBuilder: URLBuilderProtocol {
    let path: String
    let host: String
    let queryItems: [URLQueryItem]

    ///
    /// - Parameters:
    ///   - path: the path of wanted method
    ///   - host: the api hosting
    init(path: String, host: String, queryItems: [URLQueryItem] = []) {
        self.path = path
        self.host = host
        self.queryItems = queryItems
    }

    /// return the Optional(Url)
    public var url: URL? {
        var components = URLComponents()
        /* Please do not forget to check scheme type it can changes from http to https check carefully your api scheme */
        components.scheme = "http"
        components.host = host
        components.path = path
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        return components.url
    }
}

// MARK: - URL

extension URL: URLBuilderProtocol {
    public var url: URL? {
        return self
    }
}

extension String: URLBuilderProtocol {
    public var url: URL? {
        return URL(string: self)
    }
}
