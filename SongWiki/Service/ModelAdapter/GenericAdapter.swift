//
//  File.swift
//  SongWiki
//
//  Created by Lucas Pinto on 29/08/22.
//

import Foundation

protocol GenericAdapterProtocol {
    func adapter<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void)
}

class GenericAdapter: GenericAdapterProtocol {
    var connection: NetworkCaller?
    
    init(connection: NetworkCaller) {
        self.connection = connection
    }
    
    func adapter<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        connection?.request(NetworkRequest(endpointURL: endpoint, method: .get), completion: { result in
            switch result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                                
                } catch {
                    print(error)
                    completion(.failure(AdapterError.decodeError))
                }
            case .failure(_):
                completion(.failure(AdapterError.noData))
            }
        })
    }
}
