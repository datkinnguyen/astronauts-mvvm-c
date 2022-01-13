//
//  Observable.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation

/**
 Simple binding mechanism
 */
class Observable<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        self.listener = listener
        listener(value)
    }
}

