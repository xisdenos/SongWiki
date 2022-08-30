//
//  TopAlbumsModel.swift
//  SongWiki
//
//  Created by Lucas Pinto on 29/08/22.
//

import Foundation

struct TopAlbums: Codable {
    let loved: [Info]
}

struct Info: Codable {
    let strAlbum: String?
    let strArtist: String?
    let strGenre: String?
    let strDescription: String?
    let strTrackThumb: String?
}
