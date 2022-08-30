//
//  HomeViewModel.swift
//  SongWiki
//
//  Created by Lucas Pinto on 30/08/22.
//

import Foundation

class HomeViewModel {
    
    var afterApiCall: (() -> Void)?
    var albumsList: [Info]
    
    init() {
        self.albumsList = []
    }
    
    var albumsCount: Int {
        return albumsList.count
    }

    
//completionhandler: @escaping () -> Void
    
    func fetchAlbums() {
        GenericAdapter.init(connection: NetworkCaller()).adapter(endpoint: "https://theaudiodb.p.rapidapi.com/mostloved.php?format=track") {(list: Result<TopAlbums, Error>) in
            switch list {
            case .success(let albums):
                self.albumsList.append(contentsOf: albums.loved)
                self.afterApiCall?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
