//
//  HomeCoordinator.swift
//  SongWiki
//
//  Created by Lucas Pinto on 27/08/22.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var homeViewController: HomeViewController = {
        let viewController = HomeViewController()
        viewController.tabBarItem.image = UIImage(systemName: "music.note.house")
        viewController.title = "Home"
        return viewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
}
