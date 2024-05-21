//
// Created by VIPER
// Copyright (c) 2024 VIPER. All rights reserved.
//

import Foundation
import NetworkLayer

struct UniversitiesAPIDataManager: UniversitiesListAPIDataManagerInputProtocol {
    var network: RequestAction = URLSession.shared
    
    func loadUniversities(
        country: String,
        completion: @escaping (Result<[UniversityItemDTOElement], Error>) -> Void
    ) {
        let endPoint = UniversitiesEndPoint(country: country)
        print(endPoint.urlPath)
        
        network.request(for: endPoint ,
                        decoder: .init(),
                        responseValidation: HttpResponseValidator.default())
        { result in
            
            completion(result)
        }
    }
}

extension UniversitiesAPIDataManager {
    private struct UniversitiesEndPoint: EndPoint {
        let country: String
        init(country: String) {
            self.country = country
        }
        
        var urlPath: String { "search" }
        
        var parameter: Parameters? {
            return ["country": country]
        }
    }
}
