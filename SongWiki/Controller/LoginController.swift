//
//  ViewController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 19/08/22.
//

import UIKit

class LoginController: UIViewController {
    
    var loginView: LoginView = LoginView()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.delegate(delegate: self)
        self.loginView.configTextFieldDelegates(delegate: self)

    }
}

//MARK: - Extensions

extension LoginController: LoginViewProtocol{
    func actionRegisterButton() {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionEsqueceuSenhaButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension LoginController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

