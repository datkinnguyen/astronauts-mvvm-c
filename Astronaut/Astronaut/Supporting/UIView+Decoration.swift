//
//  UIView+Decoration.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     Convenience method to set up corner radius of view
     */
    func setCornerRadius(_ cornerRadius: CGFloat) -> Void {
        layer.cornerRadius = cornerRadius
    }
}
