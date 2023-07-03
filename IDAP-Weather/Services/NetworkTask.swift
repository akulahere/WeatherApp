//
//  NetworkTask.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 21.06.2023.
//

import Foundation

protocol CancellableTask {
    func cancel()
    func resume()
}

class NetworkTask: CancellableTask {
    
    private let dataTask: URLSessionDataTask
    
    init(url: URL, handler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask = URLSession.shared.dataTask(with: url, completionHandler: handler)
    }
    
    func cancel() {
        self.dataTask.cancel()
    }
    
    func resume() {
        self.dataTask.resume()
    }
}
