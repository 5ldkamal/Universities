//
//  EndPointKinde.swift
//  NetworkLayer
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

public protocol EndPointKind {
    func prepareURLRequest(urlRequest: inout URLRequest)
}

public enum EndPointKindType: EndPointKind {
    case `default`
    case `private`([String: String])

    public func prepareURLRequest(urlRequest: inout URLRequest) {
        switch self {
        case let .private(headers):
            for header in headers where !header.value.isEmpty {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }

        case .default:
            break
        }
    }
}
