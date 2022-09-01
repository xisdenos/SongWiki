//
//  DetalViewModel.swift
//  SongWiki
//
//  Created by Lucas Pinto on 01/09/22.
//

import Foundation

class DetailViewModel {
    
    var albumInfo: Info
    
    init(info: Info) {
        self.albumInfo = info
    }
    
    func getAlbumName() -> String? {
        return albumInfo.strAlbum
    }
    
    func getAlbumBandName() -> String? {
        return albumInfo.strArtist
    }
    
    func getAlbumDescription() -> String? {
        return albumInfo.strDescription
    }
    
    func getAlbumImage() -> String? {
        return albumInfo.strTrackThumb
    }
    
    func getAlbumGenre() -> String? {
        return albumInfo.strGenre
    }
}
