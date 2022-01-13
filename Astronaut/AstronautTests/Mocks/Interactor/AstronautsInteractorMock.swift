//
//  AstronautsInteractorMock.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import XCTest

final class AstronautsInteractorMock: AstronautsInteractor {
    
    typealias FetchListCompletion = (Result<AstronautsResponse, Error>) -> Void
    var getAstronautsCompletion: FetchListCompletion?
    var getListResult: Result<AstronautsResponse, Error>?
    var getListCallCount = 0
    
    typealias FetchSingleCompletion = (Result<Astronaut, Error>) -> Void
    var getAstronautDetailCompletion: FetchSingleCompletion?
    var getDetailResult: Result<Astronaut, Error>?
    var getDetailCallCount = 0
    
    func getAstronauts(limit: Int, offset: Int, completion: @escaping FetchListCompletion) {
        getAstronautsCompletion = completion
        getListCallCount += 1
        if let getListResult = getListResult {
            completion(getListResult)
        }
    }
    
    func getAstronaut(with id: Int, completion: @escaping FetchSingleCompletion) {
        getAstronautDetailCompletion = completion
        getDetailCallCount += 1
        if let getDetailResult = getDetailResult {
            completion(getDetailResult)
        }
    }
    
}

