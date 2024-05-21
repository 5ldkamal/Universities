//
//  ParameterEncodingProtocol.swift
//  Created by Khaled Kamal on 28/01/2024.
//

import Foundation

/// A type used to define how a set of parameters are applied to a `URLRequest`.
public protocol ParameterEncoding {
    func encode(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest
}
