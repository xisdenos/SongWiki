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
    
    init(navigationController: UINavigationController) {
        self.navigatorController = navigationController
    }
    
    func start() {
        let viewController: DetailViewController = DetailViewController()
        self.navigatorController.pushViewController(viewController, animated: true)
    }
    
    
}
