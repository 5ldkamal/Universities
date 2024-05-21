//
//  Mode+Paramter.swift
//
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

public protocol ParameterConvertible {
    func toBodyParameter() -> Parameters
}

// Extend the protocol to provide a default implementation
public extension ParameterConvertible {
    func toBodyParameter() -> Parameters {
        var result: [String: Any] = [:]

        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let key = child.label {
                result[key] = child.value as? String
            }
        }

        return result
    }
}
