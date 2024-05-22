//
//  HttpResponseHandler.swift
//  NetworkLayer
//
//  Created by Khaled Kamal on 20/05/2024.
//

import Foundation

public typealias Response = (data: Data, response: URLResponse)

public protocol HttpResponseValidation {
    func validate(output: Response) throws -> Response
}

public class HttpResponseValidator: HttpResponseValidation {
    var isDebug: Bool = true

   public static func `default`() -> HttpResponseValidation {
        return HttpResponseValidator()
    }

    public func validate(output: Response) throws -> Response {
        guard let response = output.response as? HTTPURLResponse,
              let status = response.status
        else {
            throw URLError(.unsupportedURL)
        }

        if isDebug {
            let serialize = try? JSONSerialization.jsonObject(with: output.data)
            print("=====>>>> debug date", serialize ?? String(data: output.data, encoding: .utf8) ?? "")
            print("=====>>>> debug Status Code:", response.statusCode)
        }

        switch status.responseType {
        case .success:
            return output

        case .clientError:
            return output

        default:
            throw "Error with status code: \(response.statusCode)"
        }
    }
}
