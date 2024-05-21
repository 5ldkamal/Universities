//
//  URLRequest+HttpMethod.swift
//
//
//  Created by Khaled Kamal on 28/01/2024.
//

import Foundation

public extension URLRequest {
    var method: HTTPMethod? {
        get { httpMethod.map(HTTPMethod.init) }
        set { httpMethod = newValue?.rawValue }
    }
}
