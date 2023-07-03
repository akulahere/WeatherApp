//
//  CacheManager.swift
//  IDAP-Weather
//
//  Created by Dmytro Akulinin on 13.06.2023.
//

import UIKit

class CacheImageManager {
    
    // MARK: -
    // MARK: Variables
    
    private let imageCache = NSCache<NSString, UIImage>()
    private let fileManager = FileManager.default
    private let cacheDirectory: URL
    
    // MARK: -
    // MARK: Initialization
    
    init() {
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        self.cacheDirectory = cacheDirectory.appendingPathComponent("imageCache")
        try? fileManager.createDirectory(at: self.cacheDirectory, withIntermediateDirectories: true, attributes: nil)
    }
    
    // MARK: -
    // MARK: Public
    
    func cacheImage(_ image: UIImage, for url: URL) {
        let urlString = url.absoluteString
        let encodedUrlString = String(urlString.hashValue)
        self.imageCache.setObject(image, forKey: encodedUrlString as NSString)
        
        let filePath = cacheDirectory.appendingPathComponent(encodedUrlString)
        if let data = image.pngData() {
            do {
                try data.write(to: filePath)
            } catch {
                print("error of writing file")
            }
        }
    }

    
    func getCachedImage(for url: URL) -> UIImage? {
        let urlString = url.absoluteString
        let encodedUrlString = String(urlString.hashValue)

        if let cachedImage = self.imageCache.object(forKey: encodedUrlString as NSString) {
            return cachedImage
        }
        
        let filePath = cacheDirectory.appendingPathComponent(encodedUrlString)
        if fileManager.fileExists(atPath: filePath.path) {
            if let image = UIImage(contentsOfFile: filePath.path) {
                self.imageCache.setObject(image, forKey: encodedUrlString as NSString)
                return image
            }
        }
        
        return nil
    }

}
