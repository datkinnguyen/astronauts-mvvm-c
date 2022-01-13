//
//  AstronautsRepository.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation
import Network

protocol AstronautsRepository {
    typealias FetchListCompletion = (Result<[Astronaut], Error>) -> Void
    func getAstronauts(completion: @escaping FetchListCompletion)
    func getAstronauts(limit: Int, offset: Int, completion: @escaping FetchListCompletion)
    
    typealias FetchSingleCompletion = (Result<Astronaut, Error>) -> Void
    func getAstronaut(with id: Int, completion: @escaping FetchSingleCompletion)
}

final class AstronautsRepositoryImpl : AstronautsRepository {
    private let interactor : AstronautsInteractor
    
    init(interactor: AstronautsInteractor) {
        self.interactor = interactor
    }
    
    func getAstronauts(completion: @escaping FetchListCompletion) {
        getAstronauts(limit: 10, offset: 10, completion: completion)
    }
    
    func getAstronauts(limit: Int, offset: Int, completion: @escaping FetchListCompletion) {
        interactor.getAstronauts(limit: limit, offset: offset, completion: { result in
            switch result {
                case .success(let response):
                    completion(.success(response.astronauts))
                case .failure(let error):
                    completion(.failure(error))
            }
        })
    }
    
    func getAstronaut(with id: Int, completion: @escaping FetchSingleCompletion) {
        interactor.getAstronaut(with: id, completion: { result in
            switch result {
                case .success(let astronaut):
                    completion(.success(astronaut))
                case .failure(let error):
                    completion(.failure(error))
            }
        })
    }
    
}

