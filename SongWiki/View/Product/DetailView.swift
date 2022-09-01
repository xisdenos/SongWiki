//
//  DetailView.swift
//  SongWiki
//
//  Created by Lucas Pinto on 31/08/22.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    lazy var gradient: UIView =  {
        let view = GradientView(colors: [UIColor.systemPurple.cgColor, UIColor(red: 153/255, green: 0/255, blue: 51/255, alpha: 1).cgColor])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Primeiro Teste"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var albumPhotoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var bandNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Primeiro Teste"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.gradient)
        addSubview(self.albumNameLabel)
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
            self.albumPhotoImageView.image = UIImage(systemName: "trash")
            return
        }
        guard let url = URL(string: unwrappedURL) else {
            return
        }
        albumPhotoImageView.af.setImage(withURL: url)
    }
    
    //MARK: - Constraints
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.gradient.topAnchor.constraint(equalTo: self.topAnchor),
            self.gradient.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.gradient.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gradient.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.albumNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.albumNameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}
