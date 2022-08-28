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
        
        self.tabBar.tintColor = UIColor(red: 153/255, green: 0/255, blue: 51/255, alpha: 1)
        self.tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = .green
    }
}
