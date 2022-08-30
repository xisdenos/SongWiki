//
//  NetworkCaller.swift
//  SongWiki
//
//  Created by Lucas Pinto on 28/08/22.
//

import Foundation

protocol NetworkCallerProtocol {
    func request(_ request: NetworkRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkCaller: NetworkCallerProtocol {
        
    func request(_ request: NetworkRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: request.endpointURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        //, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.method.rawValue.uppercased()
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NetworkError.invalidStatusCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}

