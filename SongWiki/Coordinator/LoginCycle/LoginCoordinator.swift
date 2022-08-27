//
//  LoginCoordinator.swift
//  SongWiki
//
//  Created by Lucas Pinto on 26/08/22.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController: LoginController = LoginController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
