//
//  RegisterCoordinator.swift
//  SongWiki
//
//  Created by Lucas Pinto on 27/08/22.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController: RegisterController = RegisterController()
        viewController.backButtonPopNavigation = {
            self.backToLoginScreen()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func backToLoginScreen() {
        self.navigationController.popViewController(animated: true)
    }
}
