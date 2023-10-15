//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Max Soiferman on 26/9/23.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    
    /*
     "https://firebasestorage.googleapis.com/v0/b/appetizer-183ce.appspot.com/o/response.json?alt=media&token=20e17591-62a0-4765-83fb-59a9a5705081&_gl=1*4mb4fi*_ga*OTk5ODU0MjIuMTY5NjkwNDE5NQ..*_ga_CW55HF8NVT*MTY5NjkwNDE5NS4xLjEuMTY5NjkwNjkyOS42MC4wLjA."
     */
    
    private init() {}
    
    func getProductsAsync() async throws -> [ProductModel] {
        guard let url = URL(string: appetizerURL) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ProductResponse.self, from: data).request
        } catch {
            throw APIError.invalidURL
        }
    }
    
    func getProducts(completed: @escaping (Result<[ProductModel], APIError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ProductResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func downloadImage(url: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: url)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: url) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
    
    
}

