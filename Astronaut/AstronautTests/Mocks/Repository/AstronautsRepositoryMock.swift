//
//  AstronautsRepositoryMock.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import XCTest

final class AstronautsRepositoryMock: AstronautsRepository {
    
    typealias FetchListCompletion = (Result<[Astronaut], Error>) -> Void
    var getAstronautsCompletion: FetchListCompletion?
    var getListResult: Result<[Astronaut], Error>?
    
    typealias FetchSingleCompletion = (Result<Astronaut, Error>) -> Void
    var getAstronautDetailCompletion: FetchSingleCompletion?
    var getDetailResult: Result<Astronaut, Error>?
    
    func getAstronauts(completion: @escaping FetchListCompletion) {
        getAstronautsCompletion = completion
        if let getListResult = getListResult {
            completion(getListResult)
        }
    }
    
    func getAstronauts(limit: Int, offset: Int, completion: @escaping FetchListCompletion) {
        getAstronautsCompletion = completion
        if let getListResult = getListResult {
            completion(getListResult)
        }
    }
    
    func getAstronaut(with id: Int, completion: @escaping FetchSingleCompletion) {
        getAstronautDetailCompletion = completion
        if let getDetailResult = getDetailResult {
            completion(getDetailResult)
        }
    }
}
