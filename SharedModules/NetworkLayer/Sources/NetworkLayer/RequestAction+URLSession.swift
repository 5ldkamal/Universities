//
//  RequestAction+URLSession.swift
//  NetworkLayer
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

extension URLSession: RequestAction {
    public func request<T: Decodable>(for endPoint: EndPoint, decoder: JSONDecoder, responseValidation: HttpResponseValidation, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = endPoint.urlRequest else {
            completion(.failure(InvalidURLError(url: endPoint.url)))
            return
        }

        let task = dataTask(with: urlRequest){ data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data, let response = response {
                do {
                    let validation = try responseValidation.validate(output: (data, response))
                    let model = try decoder.decode(T.self, from: validation.data)
                    completion(.success(model))

                } catch {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
    }
}
