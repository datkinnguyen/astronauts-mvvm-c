//
//  AstronautsAPI.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation

enum AstronautsAPI {
    case getAstronauts(Int, Int) // (limit: Int, offset: Int)
    case getAstronautById(Int) // astronautId: Int
}

extension AstronautsAPI: EndPointType {
    var baseURL: URL {
        URL(string: "http://spacelaunchnow.me/api/3.5.0/")!
    }
    
    var path: String {
        switch self {
        case .getAstronauts:
            return "astronaut"
        case .getAstronautById(let astronautId):
            return "astronaut/\(astronautId)"
        }
        
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getAstronauts:
            return .get
        case .getAstronautById:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getAstronauts(let limit, let offset):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["limit": limit,
                                                      "offset": offset])
        case .getAstronautById:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getAstronauts:
            return [:]
        case .getAstronautById:
            return [:]
            
        }
    }
}
