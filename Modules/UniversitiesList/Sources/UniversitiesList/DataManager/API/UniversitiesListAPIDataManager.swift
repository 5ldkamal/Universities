//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import NetworkLayer

/// A data manager responsible for handling API requests related to universities.
struct UniversitiesAPIDataManager: UniversitiesListAPIDataManagerInputProtocol {
    /// The network request action, defaulting to URLSession.shared.
    var network: RequestAction = URLSession.shared
    
    /// Loads universities from the API based on the provided country.
    ///
    /// - Parameters:
    ///   - country: The country for which universities are to be loaded.
    ///   - completion: A completion handler that takes a `Result` containing an array of `UniversityItemDTOElement` on success, or an `Error` on failure.
    func loadUniversities(
        country: String,
        completion: @escaping (Result<[UniversityItemDTOElement], Error>) -> Void
    ) {
        // Define the endpoint with the specified country.
        let endPoint = UniversitiesEndPoint(country: country)
        // Print the URL path for debugging purposes.
        print(endPoint.urlPath)
        
        // Perform the network request.
        network.request(for: endPoint,
                        decoder: .init(),
                        responseValidation: HttpResponseValidator.default())
        { result in
            // Call the completion handler with the result of the network request.
            completion(result)
        }
    }
}

/// Extension for `UniversitiesAPIDataManager` containing the endpoint definition.
extension UniversitiesAPIDataManager {
    /// A private struct representing the universities endpoint.
    private struct UniversitiesEndPoint: EndPoint {
        /// The country for which universities are to be loaded.
        let country: String
        
        /// Initializes a new `UniversitiesEndPoint` with the specified country.
        ///
        /// - Parameter country: The country for which universities are to be loaded.
        init(country: String) {
            self.country = country
        }
        
        /// The URL path for the endpoint.
        var urlPath: String { "search" }
        
        /// The parameters for the endpoint, including the specified country.
        var parameter: Parameters? {
            return ["country": country]
        }
    }
}
