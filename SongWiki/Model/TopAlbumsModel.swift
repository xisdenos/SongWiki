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
    let strAlbum: String
    let strArtist: String
    let strGenre: String
    let strDescription: String
    let strTrackThumb: String
}


//GenericAdapter.init().adapter(endpoint: "https://theaudiodb.p.rapidapi.com/mostloved.php?format=track") { (album: Result<TopAlbums, Error>) in
//    switch album {
//    case .success(let albums):
//        albums.loved.forEach({print($0.strArtist)})
//    case .failure(let error):
//        print(error)
