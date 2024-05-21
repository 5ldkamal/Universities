//
//  URLEncoding.swift
//
//
//  Created by Khaled Kamal on 28/01/2024.
//

import Foundation

/// A parameter encoding struct for URL requests
public struct URLEncoding: ParameterEncoding {
    /// Encodes the given parameters into the specified URL request
    ///
    /// - Parameters:
    ///   - urlRequest: The URL request to be encoded
    ///   - parameters: The parameters to be encoded
    /// - Returns: The encoded URL request
    /// - Throws: An error if encoding fails
    public func encode(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = urlRequest

        guard let parameters = parameters, !parameters.isEmpty else { return urlRequest }

        if let url = urlRequest.url {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = parameters.map {
                URLQueryItem(name: $0.key, value: $0.value as? String)
            }
            urlRequest.url = components?.url
        }
        return urlRequest
    }
}
