//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

// Define a typealias for the request parameters
public typealias Parameters = [String: Any]

// A protocol for defining endpoint configurations
public protocol EndPoint: URLRequestConvertible {
    var httpMethod: HTTPMethod { get } // The HTTP method to be used for the request
    var parameter: Parameters? { get } // The parameters to be included in the request
    var urlBuilder: URLBuilderProtocol { get } // The URL builder for constructing the request URL
    var urlPath: String { get } // The path component of the request URL
    var host: String { get } // The host of the request URL
    var endPointKind: EndPointKind { get } // The kind of endpoint
    var parameterEncoding: ParameterEncoding { get } // The encoding for the request parameters
}

public extension EndPoint {
    // Computed property for getting the URL based on the URL builder
    var url: URL? {
        urlBuilder.url
    }

    // Default parameter encoding to be used if not specified
    var parameterEncoding: ParameterEncoding {
        URLEncoding()
    }

    // Convert the endpoint configuration to a URLRequest
    func asURLRequest() throws -> URLRequest {
        guard let url = url else {
            throw InvalidURLError(url: url)
        }

        var request = URLRequest(url: url)

        // Prepare the URLRequest based on the endpoint kind
        endPointKind.prepareURLRequest(urlRequest: &request)

        // Set the HTTP method for the request
        request.httpMethod = httpMethod.rawValue

        // Encode the parameters using the specified encoding
        request = try parameterEncoding.encode(request, with: parameter)

        // Print the URL, URLRequest, and headers for debugging purposes
        print("The URL:\(url) , URLRequest:\(request) , with Headers:\(String(describing: request.allHTTPHeaderFields))")

        return request
    }
}
