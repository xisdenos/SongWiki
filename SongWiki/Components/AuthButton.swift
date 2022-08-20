//
//  AuthButton.swift
//  SongWiki
//
//  Created by Lucas Pinto on 19/08/22.
//

import Foundation
import UIKit

class AuthButton: UIButton {
    
    init(placeholder: String? = "Default") {
        super.init(frame: .zero)
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        backgroundColor = .systemPurple.withAlphaComponent(0.5)
        setTitleColor(UIColor(white: 1, alpha: 0.40), for: .normal)
        setTitle(placeholder, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}
