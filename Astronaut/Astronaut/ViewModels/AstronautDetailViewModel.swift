//
//  AstronautDetailViewModel.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation

class AstronautDetailViewModel {
    
    private let repository: AstronautsRepository
    weak var delegate: LoadingDelegate?
    
    var astronaut: Observable<AstronautViewModel> = Observable(nil)
    let astronautId: Int
    
    init(repository: AstronautsRepository, astronautId: Int) {
        self.repository = repository
        self.astronautId = astronautId
    }
    
    func fetchData() {
        delegate?.updateLoading(state: .loading)
        repository.getAstronaut(with: astronautId, completion: { [weak self] result in
            switch result {
            case .success(let astrounaut):
                self?.astronaut.value = AstronautViewModel(astronaut: astrounaut)
                self?.delegate?.updateLoading(state: .success)
            case .failure(let error):
                self?.delegate?.updateLoading(state: .failure(error))
            }
        })
    }
}
