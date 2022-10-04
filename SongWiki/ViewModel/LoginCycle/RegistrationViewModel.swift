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
    
    //MARK: - Validations variables
    
    var imputNotEmpty: Bool {
        return
            email?.isEmpty == false &&
            user?.isEmpty == false &&
            password?.isEmpty == false &&
            passwordConfirmation?.isEmpty == false
    }
    
    var passwordEqualPasswordConfirmation: Bool {
        return password == passwordConfirmation
    }
    
    var shouldEnableButton: Bool {
        return
            imputNotEmpty &&
            passwordEqualPasswordConfirmation
    }
    
    var buttonTitleColor: UIColor {
        return imputNotEmpty ? .white : UIColor(white: 1, alpha: 0.40)
    }
    
    var buttonBackgroundColor: UIColor {
        return imputNotEmpty ? .systemPurple : .systemPurple.withAlphaComponent(0.5)
    }
    
    //MARK: - Validations functions
    
    func validateEmail() -> Bool {
        guard let email = email else {
            return false
        }
        if !email.isEmpty {
            return email.contains("@") && email.contains(".")
        }
        return false
    }
}
