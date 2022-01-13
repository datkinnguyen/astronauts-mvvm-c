//
//  AstronautsRepositoryTests.swift
//  AstronautTests
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import XCTest

final class AstronautsRepositoryTests: XCTestCase {
    
    var interactor: AstronautsInteractorMock!
    var repository: AstronautsRepositoryImpl!
    
    override func setUp() {
        super.setUp()
        interactor = AstronautsInteractorMock()
        repository = AstronautsRepositoryImpl(interactor: interactor)
    }
    
    func testFetchDataListSuccess() {
        let stubData = StubModelFactory.modelAstronautsResponseObject()
        interactor.getListResult = .success(stubData)
        
        repository.getAstronauts { getListResult in
            switch getListResult {
            case .success(let astronauts):
                XCTAssertEqual(self.interactor.getListCallCount, 1)
                XCTAssertEqual(astronauts.count, stubData.astronauts.count)
                XCTAssertEqual(astronauts[0].id, stubData.astronauts[0].id)
                XCTAssertEqual(astronauts[1].id, stubData.astronauts[1].id)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func testFetchDataListFailure() {
        interactor.getListResult = .failure(NetworkResponseError.failed)
        
        repository.getAstronauts { getListResult in
            switch getListResult {
            case .success(let astronauts):
                XCTAssertNil(astronauts)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
    
    func testFetchDataDetailSuccess() {
        let stubData = StubModelFactory.modelAstronautObject()
        interactor.getDetailResult = .success(stubData)
        
        repository.getAstronaut(with: stubData.id, completion: { getDetailResult in
            switch getDetailResult {
            case .success(let astronaut):
                XCTAssertEqual(self.interactor.getDetailCallCount, 1)
                XCTAssertEqual(astronaut.id, stubData.id)
            case .failure(let error):
                XCTAssertNil(error)
            }
        })
    }
    
    func testFetchDataDetailFailure() {
        interactor.getListResult = .failure(NetworkResponseError.failed)
        
        repository.getAstronaut(with: 1, completion: { getListResult in
            switch getListResult {
            case .success(let astronauts):
                XCTAssertNil(astronauts)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        })
    }
    
}

