//
//  WeakBox.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 26.06.2023.
//

import Foundation

class WeakBox<T: AnyObject> {
    weak var wrapped: T?
    
    init(_ value: T) {
        wrapped = value
    }
}
