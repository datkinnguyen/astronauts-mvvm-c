//
//  UIViewController+Instantiate.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func instantiate(storyboardName: UIStoryboard.Name) -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}

