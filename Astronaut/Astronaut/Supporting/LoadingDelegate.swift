//
//  LoadingDelegate.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation

enum LoadingState {
    case loading
    case success
    case failure(_ error: Error!)
}

protocol LoadingDelegate: AnyObject {
    func updateLoading(state: LoadingState)
}
