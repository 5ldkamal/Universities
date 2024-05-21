//
//  Requstable.swift
//  NetworkLayer
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Combine
import Foundation

public protocol RequestAction {
    func request<T: Decodable>(for endPoint: EndPoint,
                               decoder: JSONDecoder,
                               responseValidation: HttpResponseValidation,
                               completion: @escaping (Result<T, Error>) -> Void)
}
