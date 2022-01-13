//
//  ViewControllerFactory.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import UIKit

/**
 Factory to provide ViewControllers
 */
struct ViewControllerFactory {
    
    static func astronautsViewController() -> AstronautsViewController {
        
        let interactor = AstronautsInteractorImpl()
        let repository = AstronautsRepositoryImpl(interactor: interactor)
        let viewModel = AstronautListViewModel(repository: repository)
        
        let viewController = AstronautsViewController.instantiate(storyboardName: .astronauts)
        viewController.astronautListViewModel = viewModel
        viewModel.delegate = viewController
        
        return viewController
    }
    
    static func astronautDetailViewController(astronautId: Int) -> AstronautDetailViewController {
        
        let interactor = AstronautsInteractorImpl()
        let repository = AstronautsRepositoryImpl(interactor: interactor)
        let viewModel = AstronautDetailViewModel(repository: repository, astronautId: astronautId)
        
        let viewController = AstronautDetailViewController.instantiate(storyboardName: .astronautDetail)
        viewController.astronautDetailViewModel = viewModel
        viewModel.delegate = viewController
        
        return viewController
    }
}
