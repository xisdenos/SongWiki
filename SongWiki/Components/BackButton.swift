//
//  BackButton.swift
//  SongWiki
//
//  Created by Lucas Pinto on 24/08/22.
//

import Foundation
import UIKit

class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setImage(UIImage(systemName: "arrow.backward.circle"), for: .normal)
        tintColor = UIColor(red: 153/255, green: 0/255, blue: 51/255, alpha: 1)
        backgroundColor = UIColor(white: 1, alpha: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
