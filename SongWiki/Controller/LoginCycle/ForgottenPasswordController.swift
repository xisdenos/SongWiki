//
//  ForgottenPasswordController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 24/08/22.
//

import Foundation
import UIKit

class ForgottenPasswordController: UIViewController {
    
    public var backButtonPopNavigation: (() -> Void)?
    public var forgottenPasswordView: ForgottenPasswordView = ForgottenPasswordView()
    
    override func loadView() {
        super.loadView()
        self.view = forgottenPasswordView
        
        forgottenPasswordView.backButtonPopNavigation = { [weak self] in
            guard let self = self else { return }
            self.backButtonPopNavigation?()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.forgottenPasswordView.configTextFieldDelegate(delegate: self)
    }
}

extension ForgottenPasswordController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
