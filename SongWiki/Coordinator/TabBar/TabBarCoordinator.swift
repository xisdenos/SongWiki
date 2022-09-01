//
//  TabBarCoordinator.swift
//  SongWiki
//
//  Created by Lucas Pinto on 27/08/22.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController: TabBarController = TabBarController()
        
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        let searchCoordinator = SearchCoordinator(navigationController: self.navigationController)
        
        tabBarController.setViewControllers([homeCoordinator.homeViewController, searchCoordinator.searchViewController], animated: true)
        homeCoordinator.start()
        self.navigationController.pushViewController(tabBarController, animated: true)
        
    }
}
