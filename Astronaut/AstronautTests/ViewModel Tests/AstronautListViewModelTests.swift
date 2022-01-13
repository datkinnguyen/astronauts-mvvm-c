//
//  AstronautListViewModelTests.swift
//  AstronautTests
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import XCTest

final class AstronautListViewModelTests: XCTestCase {
    
    var repository: AstronautsRepositoryMock!
    var viewModel: AstronautListViewModel!
    
    override func setUp() {
        super.setUp()
        repository = AstronautsRepositoryMock()
        viewModel = AstronautListViewModel(repository: repository)
    }
    
    func testFetchDataSuccess() {
        // prepare mock data
        let stubList = StubModelFactory.modelAstronautsResponseObject()
        repository.getListResult = .success(stubList.astronauts)
        
        viewModel.fetchData()
        
        XCTAssertEqual(viewModel.astronautViewModels.value?.count, stubList.astronauts.count)
        XCTAssertEqual(viewModel.astronautViewModels.value?[0].id, stubList.astronauts[0].id)
        XCTAssertEqual(viewModel.astronautViewModels.value?[1].id, stubList.astronauts[1].id)
    }
    
    func testFetchDataFailure() {
        // prepare mock data
        repository.getListResult = .failure(NetworkResponseError.failed)
        
        viewModel.fetchData()
        
        XCTAssertEqual(viewModel.astronautViewModels.value?.count, 0)
    }
}

