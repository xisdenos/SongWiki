//
//  TopAlbumsModel.swift
//  SongWiki
//
//  Created by Lucas Pinto on 29/08/22.
//

import Foundation

struct TopAlbums: Codable {
    var loved: [Info]
}

struct Info: Codable, Hashable, Equatable {
    var strAlbum: String
}
