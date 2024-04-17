//
//  NetworkManager.swift
//  ImagePreview
//
//  Created by Sachin Kumar on 15/04/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    func getResponse<T: Codable>(url: URL?,
                                       expecting: T.Type,
                                       completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            return completion(.failure(CustomError.invalidUrl))
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error  in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidUrl))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
