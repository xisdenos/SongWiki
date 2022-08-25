//
//  ForgottenPasswordController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 24/08/22.
//

import Foundation
import UIKit

class ForgottenPasswordController: UIViewController {
    
    var forgottenPasswordView: ForgottenPasswordView?
    
    override func loadView() {
        super.loadView()
        self.forgottenPasswordView = ForgottenPasswordView()
        self.view = forgottenPasswordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
