//
//  SearchCoordinator.swift
//  SongWiki
//
//  Created by Lucas Pinto on 27/08/22.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    var searchViewController: SearchViewController = {
        let viewController = SearchViewController()
        viewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        viewController.title = "Search"
        return viewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
}
