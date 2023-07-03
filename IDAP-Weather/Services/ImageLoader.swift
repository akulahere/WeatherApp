//
//  ImageLoader.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 13.06.2023.
//

import UIKit

protocol ImageLoaderProtocol {
    func loadImage(from url: URL, completion: @escaping ResultedCompletion<UIImage>) -> CancellableTask?
}

class ImageLoader: ImageLoaderProtocol {
    
    // MARK: -
    // MARK: Variables
    
    private let imageCacheManager = CacheImageManager()
    
    enum ImageLoadingError: Error, LocalizedError {
        case failedToConvertDataToImage
        
        var errorDescription: String? {
            switch self {
                case .failedToConvertDataToImage:
                    return "Failed to convert data to image."
            }
        }
    }
    
    // MARK: -
    // MARK: Public
    
    @discardableResult
    func loadImage(from url: URL, completion: @escaping ResultedCompletion<UIImage>) -> CancellableTask? {
        if let cachedImage = self.imageCacheManager.getCachedImage(for: url) {
            completion(.success(cachedImage))
            return nil
        }
        
        let task = NetworkTask(url: url) {[weak self] (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                if let image = UIImage(data: data) {
                    self?.imageCacheManager.cacheImage(image, for: url)
                    completion(.success(image))
                } else {
                    completion(.failure(ImageLoadingError.failedToConvertDataToImage))
                }
            }
        }
        task.resume()
        return task
    }

    
}

