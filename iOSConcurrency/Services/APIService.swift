//
//  APIService.swift
//  iOSConcurrency
//
//  Created by Frank Bara on 1/21/22.
//

import Foundation

struct APIService {
    let urlString: String
    
    func getJSON<T: Decodable>(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                                keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                                completion: @escaping (Result<T, APIError>) -> ()) {
        guard let url = URL(string: urlString)
            else {
                completion(.failure(.invalideURL))
                return
            }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                completion(.failure(.invalideResponseStatus))
                return
            }
            
            guard error == nil
                else {
                    completion(.failure(.dataTaskError))
                    return
                }
            guard let data = data
                else {
                    completion(.failure(.corruptData))
                    return
                }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}

enum APIError: Error {
    case invalideURL
    case invalideResponseStatus
    case dataTaskError
    case corruptData
    case decodingError
}
