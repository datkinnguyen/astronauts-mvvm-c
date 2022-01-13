//
//  CellConfigurable.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation

protocol CellConfigurable {
    associatedtype CellModel
    func configure(model : CellModel)
}
