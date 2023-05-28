//
//  imageloader.swift
//  nsCache
//
//  Created by Dip Dutt on 28/5/23.
//

import Foundation
import UIKit

enum NetWorkError:Error {
case badRequest
case unsupportedImage
case badUrl
}

@MainActor
class ImageLoader:ObservableObject {
    @Published var images:UIImage?
    private static let cache = NSCache<NSString,UIImage>()
    
    func fetchImage(_ url:URL?)async throws {
        
        guard let url = url else {
            throw NetWorkError.badUrl
        }
        let request = URLRequest(url: url)
        
        // CHECK IN THE CACHE
        if let cachedimages = Self.cache.object(forKey: url.absoluteString as NSString) {
             images = cachedimages
        }
        
        else {
            let (data,response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                throw NetWorkError.badRequest
            }
            guard let image = UIImage(data:data ) else {
                throw NetWorkError.unsupportedImage
            }
            // store in the cache
            Self.cache.setObject(image, forKey:url.absoluteString as NSString )
            images = image
        }
    }
}
