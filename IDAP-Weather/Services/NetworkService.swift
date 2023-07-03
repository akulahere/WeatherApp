//
//  URLService.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 13.06.2023.
//

import Foundation


protocol NetworkServiceProtocol {
    func request<T: Decodable>(url: URL, completion: @escaping ResultedCompletion<T>)

}

class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(url: URL, completion: @escaping ResultedCompletion<T>) {
        
        let task = NetworkTask(url: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
