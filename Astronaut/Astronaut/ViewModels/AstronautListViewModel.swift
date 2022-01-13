//
//  AstronautListViewModel.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation

class AstronautListViewModel {
    
    private let repository: AstronautsRepository
    weak var delegate: LoadingDelegate?
    
    var astronautViewModels: Observable<[AstronautViewModel]> = Observable([])
    var sortBy: Observable<SortBy> = Observable(.name)
    var sortType: Observable<SortType> = Observable(.AZ)
    
    init(repository : AstronautsRepository) {
        self.repository = repository
    }
    
    func fetchData() {
        delegate?.updateLoading(state: .loading)
        repository.getAstronauts(completion: { [weak self] result in
            switch result {
            case .success(let astronauts):
                var viewModels = self?.parse(astronauts)
                self?.sortAstronauts(&viewModels, by: self?.sortBy.value, type: self?.sortType.value)
                self?.astronautViewModels.value = viewModels
                self?.delegate?.updateLoading(state: .success)
            case .failure(let error):
                self?.delegate?.updateLoading(state: .failure(error))
            }
        })
    }
}

// MARK: Data parsing
extension AstronautListViewModel {
    
    func parse(_ astronauts: [Astronaut]) -> [AstronautViewModel] {
        astronauts.compactMap{ AstronautViewModel(astronaut: $0) }
    }
    
    func performSort(by: SortBy?, type: SortType?) -> Void {
        var viewModels = astronautViewModels.value
        sortAstronauts(&viewModels, by: by, type: type)
        astronautViewModels.value = viewModels
    }
    
    private func sortAstronauts(_ astronauts: inout [AstronautViewModel]?, by: SortBy?, type: SortType?) -> Void {
        switch by {
        case .name:
            astronauts?.sort {
                switch type {
                case .AZ:
                    return $0.name?.localizedStandardCompare($1.name ?? "") == .orderedAscending
                case .ZA:
                    return $0.name?.localizedStandardCompare($1.name ?? "") == .orderedDescending
                case .none:
                    return true
                }
            }
        case .nationality:
            astronauts?.sort {
                switch type {
                case .AZ:
                    return $0.nationality?.localizedStandardCompare($1.nationality ?? "") == .orderedAscending
                case .ZA:
                    return $0.nationality?.localizedStandardCompare($1.nationality ?? "") == .orderedDescending
                case .none:
                    return true
                }
            }
        case .none:
            break
        }
    }
    
}


