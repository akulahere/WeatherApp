//
//  ResultedCompletion.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 03.07.2023.
//

import Foundation


typealias ResultedCompletion<R> = (Result<R, Error>) -> Void
