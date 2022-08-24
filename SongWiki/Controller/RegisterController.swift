//
//  RegisterController.swift
//  SongWiki
//
//  Created by Franklin  Stilhano on 8/20/22.
//

import UIKit

class RegisterController: UIViewController {

    var registerController:RegisterView?
    
    override func loadView() {
        self.registerController = RegisterView()
        self.view = self.registerController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
