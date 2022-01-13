//
//  AppCoordinator.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    func start() {
        // instantiate AstronautsViewController as root screen
        let astronautsViewController = ViewControllerFactory.astronautsViewController()
        astronautsViewController.didSelectAstronaut = { [weak self] astronautViewModel in
            self?.pushAstronautDetail(astronautId: astronautViewModel.id)
        }
        navigationController.viewControllers = [astronautsViewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func pushAstronautDetail(astronautId: Int) {
        
        let astronautDetailViewController = ViewControllerFactory.astronautDetailViewController(astronautId: astronautId)
        navigationController.pushViewController(astronautDetailViewController, animated: true)
    }
}

