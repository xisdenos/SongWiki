//
//  NetworkError.swift
//  SongWiki
//
//  Created by Lucas Pinto on 28/08/22.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidURL
    case invalidStatusCode
    case networkError
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return "Data error"
        case .invalidURL:
            return "Invalid URL"
        case .invalidStatusCode:
            return "Invalid status code"
        case .networkError:
            return "An error has occurred. Please verify your connection."
        }
    }
}
