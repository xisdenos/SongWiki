//
//  RegisterVC.swift
//  SongWiki
//
//  Created by Franklin  Stilhano on 8/24/22.
//

import UIKit

class RegisterVC: UIViewController {

    var registerScreen:RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
