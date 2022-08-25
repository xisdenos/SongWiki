//
//  RegisterController.swift
//  SongWiki
//
//  Created by Franklin  Stilhano on 8/20/22.
//

import UIKit

class RegisterController: UIViewController {

    var registerView:RegisterView?
    
    override func loadView() {
        self.registerView = RegisterView()
        self.view = self.registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.registerView?.delegate(delegate: self)
        self.registerView?.configTextFieldDelegates(delegate: self)
    }
}

extension RegisterController: RegisterViewProtocol, UITextFieldDelegate {
    
    func backButtonPopNavigation() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
