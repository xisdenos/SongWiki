//
//  ForgottenPasswordViewModel.swift
//  SongWiki
//
//  Created by Lucas Pinto on 24/08/22.
//

import Foundation
import UIKit

struct ForgottenPasswordViewModel: FieldValidation {
    
    var email: String?
    
    //MARK: - Validations
    
    var imputNotEmpty: Bool {
        return email?.isEmpty == false
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
