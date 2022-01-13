//
//  AstronautDetailViewModelTests.swift
//  AstronautTests
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import XCTest

final class AstronautDetailViewModelTests: XCTestCase {
    
    var repository: AstronautsRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = AstronautsRepositoryMock()
    }
    
    func testFetchDataSuccess() {
        // prepare mock data
        let astronaut = StubModelFactory.modelAstronautObject()
        let viewModel = AstronautDetailViewModel(repository: repository, astronautId: astronaut.id)
        repository.getDetailResult = .success(astronaut)
        
        viewModel.fetchData()
        
        XCTAssertNotNil(viewModel.astronaut.value)
        XCTAssertEqual(viewModel.astronaut.value?.id, astronaut.id)
        XCTAssertEqual(viewModel.astronaut.value?.name, astronaut.name)
    }
    
    func testFetchDataFailure() {
        // prepare mock data
        let astronaut = StubModelFactory.modelAstronautObject()
        let viewModel = AstronautDetailViewModel(repository: repository, astronautId: astronaut.id)
        repository.getDetailResult = .failure(NetworkResponseError.failed)
        
        viewModel.fetchData()
        
        XCTAssertNil(viewModel.astronaut.value)
    }
}

