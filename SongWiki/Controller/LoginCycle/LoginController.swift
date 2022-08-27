//
//  ViewController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 19/08/22.
//

import UIKit

class LoginController: UIViewController {
    
    var changeToForgottenPasswordScreen: (() -> Void)?
    var changeToRegisterScreen: (() -> Void)?
    var loginView: LoginView = LoginView()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
        
        loginView.changeToRegisterScreen = { [weak self] in
            guard let self = self else { return }
            self.changeToRegisterScreen?()
        }
        
        loginView.changeToForgottenPasswordScreen = { [weak self] in
            guard let self = self else { return }
            self.changeToForgottenPasswordScreen?()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.configTextFieldDelegates(delegate: self)

    }
}

//MARK: - Extensions


extension LoginController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

