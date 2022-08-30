//
//  HomeView.swift
//  SongWiki
//
//  Created by Lucas Pinto on 29/08/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var gradient: UIView =  {
        let view = GradientView(colors: [UIColor.systemPurple.cgColor, UIColor(red: 153/255, green: 0/255, blue: 51/255, alpha: 1).cgColor])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Olá, Usuario"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var userFaceImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 52).isActive = true
        image.heightAnchor.constraint(equalToConstant: 52).isActive = true
        image.layer.cornerRadius = 25
        image.backgroundColor = .gray
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.addArrangedSubview(welcomeLabel)
        stack.addArrangedSubview(userFaceImage)
        stack.distribution = .equalSpacing
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        
//        layout.itemSize = CGSize(width: 150, height: 100)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TopAlbumCollectionViewCell.self, forCellWithReuseIdentifier: TopAlbumCollectionViewCell.identifier)
        cv.backgroundColor = UIColor(white: 1, alpha: 0)
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    //MARK: - Delegates
    
    func collectionViewDelegate(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.gradient)
        addSubview(self.stackView)
        addSubview(self.collectionView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.gradient.topAnchor.constraint(equalTo: self.topAnchor),
            self.gradient.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.gradient.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gradient.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            self.collectionView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 15),
            self.collectionView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
}
