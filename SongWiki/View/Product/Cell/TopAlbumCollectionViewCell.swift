//
//  TopAlbumCollectionViewCell.swift
//  SongWiki
//
//  Created by Lucas Pinto on 29/08/22.
//

import UIKit
import AlamofireImage

class TopAlbumCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopAlbumCollectionViewCell"
    
    lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Album"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var albumLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "trash")
        image.contentMode = .scaleAspectFill
        image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return image
    }()
    
    lazy var bandNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Banda"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 55
        stack.addArrangedSubview(albumNameLabel)
        stack.addArrangedSubview(albumLogo)
        stack.addArrangedSubview(bandNameLabel)
        stack.distribution = .fillEqually
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(stackView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetUp function
    
    func setUpCell(albumInfo: Info ) {
        self.albumNameLabel.text = albumInfo.strAlbum
        self.bandNameLabel.text = albumInfo.strArtist
        
        guard let unwrappedURL = albumInfo.strTrackThumb else {
            self.albumLogo.image = UIImage(systemName: "trash")
            return
        }
        guard let url = URL(string: unwrappedURL) else {
            return
        }
        albumLogo.af.setImage(withURL: url)
    }
    
    //MARK: - Constraints
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        
        ])
    }
}

