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
        
    }
    
}

