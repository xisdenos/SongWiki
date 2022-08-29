//
//  AdapterError.swift
//  SongWiki
//
//  Created by Lucas Pinto on 29/08/22.
//

import Foundation

enum AdapterError: Error {
    case decodeError
    case noData
}

extension AdapterError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .decodeError:
            return "Error during data decoding"
        case .noData:
            return "Data error"
        }
    }
}
