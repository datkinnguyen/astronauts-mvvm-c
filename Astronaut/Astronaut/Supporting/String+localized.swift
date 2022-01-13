//
//  NSString+localized.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
