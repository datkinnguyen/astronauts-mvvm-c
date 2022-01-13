//
//  AstronautsInteractor.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation

protocol AstronautsInteractor {
    typealias FetchListCompletion = (Result<AstronautsResponse, Error>) -> Void
    func getAstronauts(limit: Int, offset: Int, completion: @escaping FetchListCompletion)
    
    typealias FetchSingleCompletion = (Result<Astronaut, Error>) -> Void
    func getAstronaut(with id: Int, completion: @escaping FetchSingleCompletion)
}

struct AstronautsInteractorImpl: AstronautsInteractor {
    
    let service = NetworkServiceImpl<AstronautsAPI>()
    
    func getAstronauts(limit: Int, offset: Int, completion: @escaping FetchListCompletion) {
        service.request(.getAstronauts(limit, offset)) { result in
            completion(result)
        }
    }
    
    func getAstronaut(with id: Int, completion: @escaping FetchSingleCompletion) {
        service.request(.getAstronautById(id)) { result in
            completion(result)
        }
    }
}
