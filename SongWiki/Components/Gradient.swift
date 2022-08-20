//
//  Gradient.swift
//  SongWiki
//
//  Created by Lucas Pinto on 19/08/22.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    let gradient = CAGradientLayer()
    
    init(colors: [CGColor]) {
        super.init(frame: .zero)
        gradient.frame = bounds
        gradient.colors = colors
        layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        gradient.frame = bounds
    }
    
}
