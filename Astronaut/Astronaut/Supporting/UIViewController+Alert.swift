//
//  UIViewController+Alert.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok".localized, style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
