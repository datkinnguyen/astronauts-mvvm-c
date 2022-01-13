//
//  AstronautListViewModel.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
    case request
    
    case requestParameters(
        bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?
    )
    
    case requestParametersAndHeaders(
        bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?
    )

    // case download, upload...etc
}
