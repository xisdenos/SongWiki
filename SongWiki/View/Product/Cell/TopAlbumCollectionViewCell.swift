//
//  TopAlbumCollectionViewCell.swift
//  SongWiki
//
//  Created by Lucas Pinto on 29/08/22.
//

import UIKit

class TopAlbumCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopAlbumCollectionViewCell"
    
    lazy var testView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(testView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.testView.topAnchor.constraint(equalTo: self.topAnchor),
            self.testView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.testView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.testView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

