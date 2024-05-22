//
//  JSONEncoding.swift
//
//
//  Created by Khaled Kamal on 28/01/2024.
//

import Foundation

/// A type that defines how parameters should be encoded in a URL request.
struct JSONEncoding: ParameterEncoding {
    /// An error that can occur during JSON encoding.
    public enum Error: LocalizedError {
        case invalidJSONObject
        case parameterEncodingFailed(JsonError)

        /// An error that can occur during JSON encoding.
        indirect enum JsonError: Swift.Error {
            case invalidJSONObject
            case jsonEncodingFailed(error: Swift.Error)
        }

        /// A description of the error.
        public var errorDescription: String? {
            switch self {
            case .invalidJSONObject:
                return "JSONEncoding: invalidJSONObject"
            case let .parameterEncodingFailed(jsonError):
                switch jsonError {
                case .invalidJSONObject:
                    return "JSONEncoding: invalidJSONObject"
                case let .jsonEncodingFailed(error):
                    return "JSONEncoding: \(error.localizedDescription)"
                }
            }
        }
    }

    // MARK: Properties

    /// Returns a `JSONEncoding` instance with default writing options.
    public static var `default`: JSONEncoding { JSONEncoding() }

    /// Returns a `JSONEncoding` instance with `.prettyPrinted` writing options.
    public static var prettyPrinted: JSONEncoding { JSONEncoding(options: .prettyPrinted) }

    /// The options for writing the parameters as JSON data.
    public let options: JSONSerialization.WritingOptions

    // MARK: Initialization

    /// Creates an instance using the specified `WritingOptions`.
    ///
    /// - Parameter options: `JSONSerialization.WritingOptions` to use.
    public init(options: JSONSerialization.WritingOptions = []) {
        self.options = options
    }

    // MARK: Encoding

    /// Encodes the given parameters into the specified URL request.
    ///
    /// - Parameters:
    ///   - urlRequest: The URL request to encode the parameters into.
    ///   - parameters: The parameters to be encoded.
    /// - Throws: An error if the encoding fails.
    /// - Returns: The encoded URL request.
    func encode(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = urlRequest

        guard let parameters = parameters else { return urlRequest }

        guard JSONSerialization.isValidJSONObject(parameters) else {
            throw Error.parameterEncodingFailed(.invalidJSONObject)
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: parameters,
                                                  options: options)

            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

            urlRequest.httpBody = data
        } catch {
            throw Error.parameterEncodingFailed(.jsonEncodingFailed(error: error))
        }

        return urlRequest
    }
}
