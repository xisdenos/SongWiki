//
//  Divider.swift
//  SongWiki
//
//  Created by Lucas Pinto on 19/08/22.
//

import Foundation
import UIKit

class DividerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.text = "Ou"
        label.textColor = UIColor(white: 1, alpha: 0.87)
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        let divider1 = UIView()
        divider1.backgroundColor = UIColor(white: 1, alpha: 0.25)
        divider1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(divider1)
        divider1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        divider1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        divider1.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -8).isActive = true
        divider1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let divider2 = UIView()
        divider2.backgroundColor = UIColor(white: 1, alpha: 0.25)
        divider2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(divider2)
        divider2.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        divider2.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8).isActive = true
        divider2.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        divider2.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
