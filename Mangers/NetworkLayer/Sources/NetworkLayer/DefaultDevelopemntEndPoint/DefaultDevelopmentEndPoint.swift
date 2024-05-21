
import Foundation

public extension URLBuilder {
    static func development(path: String, host: String, queryItems: [URLQueryItem] = []) -> URLBuilder {
        let api = "/"
        return URLBuilder(path: api + path, host: host, queryItems: queryItems)
    }
}

public extension EndPointKindType {
    static func development() -> EndPointKindType {
        EndPointKindType.default
    }
}

// MARK: - Development API

public extension EndPoint {
    var host: String {
        return "universities.hipolabs.com"
    }

    var urlBuilder: URLBuilderProtocol {
        return URLBuilder.development(path: urlPath, host: host)
    }

    var httpMethod: HTTPMethod { .get }

    var parameter: Parameters? { nil }

    var endPointKind: EndPointKind { EndPointKindType.development() }
}
