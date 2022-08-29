//
//  NetworkRequest.swift
//  SongWiki
//
//  Created by Lucas Pinto on 28/08/22.
//

import Foundation

struct NetworkRequest {
    var endpointURL: String
    var method: HTTPMethod
    let headers = [
        "X-RapidAPI-Key": "df7706cb3dmsh1b14ce9c8698e62p14dcf4jsn2e6b898fe19a",
        "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
    ]
}

enum HTTPMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}
