//
//  DetailViewCoordinator.swift
//  SongWiki
//
//  Created by Lucas Pinto on 31/08/22.
//

import Foundation
import UIKit

class DetailCoordinator: Coordinator {
    var navigatorController: UINavigationController
    var infoFromHome: Info
    
    init(navigationController: UINavigationController, infoDetails: Info) {
        self.navigatorController = navigationController
        self.infoFromHome = infoDetails
    }
    
    func start() {
        let viewController: DetailViewController = DetailViewController(with: Info(strAlbum: infoFromHome.strAlbum, strArtist: infoFromHome.strArtist, strGenre: infoFromHome.strGenre, strDescription: infoFromHome.strDescription, strTrackThumb: infoFromHome.strTrackThumb))
        
        self.navigatorController.pushViewController(viewController, animated: true)
    }
    
    
}
