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
        
        viewController.changeToRegisterScreen = {
            self.startRegisterScreen()
        }
        
        viewController.changeToForgottenPasswordScreen = {
            self.startForgottenPasswordScreen()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startRegisterScreen() {
        let coordinator: RegisterCoordinator = RegisterCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    private func startForgottenPasswordScreen() {
        let coordinator: ForgottenPasswordCoordinator = ForgottenPasswordCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
