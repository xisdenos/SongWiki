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
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var albumPhotoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return image
    }()
    
    lazy var bandNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Primeiro Teste"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.addArrangedSubview(albumNameLabel)
        sv.addArrangedSubview(albumPhotoImageView)
        sv.addArrangedSubview(bandNameLabel)
        sv.spacing = 10
        sv.isUserInteractionEnabled = true
        return sv
    }()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.gradient)
        addSubview(self.stackView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetUp function
    func setUpCell(albumInfo: DetailViewModel ) {
        self.albumNameLabel.text = albumInfo.getAlbumName()
        self.bandNameLabel.text = albumInfo.getAlbumBandName()
        
        guard let unwrappedURL = albumInfo.getAlbumImage() else {
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
            
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
    }
}
