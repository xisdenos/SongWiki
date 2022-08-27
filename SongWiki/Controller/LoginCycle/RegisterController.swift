//
//  RegisterController.swift
//  SongWiki
//
//  Created by Franklin  Stilhano on 8/20/22.
//

import UIKit

class RegisterController: UIViewController {

    public var backButtonPopNavigation: (() -> Void)?
    public var registerView:RegisterView = RegisterView()
    
    override func loadView() {
        self.view = self.registerView
        
        registerView.backButtonPopNavigation = { [weak self] in
            guard let self = self else { return }
            self.backButtonPopNavigation?()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.registerView.configTextFieldDelegates(delegate: self)
    }
}

extension RegisterController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
