//
//  RegistrationViewModel.swift
//  SongWiki
//
//  Created by Lucas Pinto on 24/08/22.
//

import Foundation
import UIKit

struct RegistrationViewModel: FieldValidation {
    
    var email: String?
    var user: String?
    var password: String?
    var passwordConfirmation: String?
    
    var imputNotEmpty: Bool {
        return
        email?.isEmpty == false &&
        user?.isEmpty == false &&
        password?.isEmpty == false &&
        passwordConfirmation?.isEmpty == false &&
        password == passwordConfirmation
    }
    
    var shouldEnableButton: Bool {
        return imputNotEmpty
    }
    
    var buttonTitleColor: UIColor {
        return imputNotEmpty ? .white : UIColor(white: 1, alpha: 0.40)
    }
    
    var buttonBackgroundColor: UIColor {
        return imputNotEmpty ? .systemPurple : .systemPurple.withAlphaComponent(0.5)
    }
    
    
}
