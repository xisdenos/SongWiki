//
//  TabBarController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 27/08/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        self.tabBar.tintColor = .yellow
        self.tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = .green
    }
}
