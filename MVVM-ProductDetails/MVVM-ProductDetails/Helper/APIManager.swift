//
//  APIManager.swift
//  MVVM-ProductDetails
//
//  Created by Anand Yadav on 22-05-2024.
//

import Foundation
//https://fakestoreapi.com/products

enum DataError:Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case message(_ error:Error?)
}

typealias handler = (Result<[Product], DataError>) -> Void
class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func fetchProducts(completion: @escaping handler) {
        guard let url = URL(string: Constant.API.productURL) else {
            completion(.failure(.invalidData))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                    200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
}
