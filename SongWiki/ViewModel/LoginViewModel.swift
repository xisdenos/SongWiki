//
//  LoginViewModel.swift
//  SongWiki
//
//  Created by Lucas Pinto on 23/08/22.
//

import Foundation
import UIKit

struct LoginViewModel {
    var email: String?
    var password: String?
    var imputNotEmpty: Bool {
        return email?.isEmpty == false &&
        password?.isEmpty == false
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
// agora vai
// agora vai 2
