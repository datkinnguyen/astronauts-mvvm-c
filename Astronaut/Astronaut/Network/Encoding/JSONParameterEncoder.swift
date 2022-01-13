//
//  AstronautListViewModel.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            guard urlRequest.value(forHTTPHeaderField: "Content-Type") == nil else { return }
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
