//
//  HomeViewController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 27/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView: HomeView = HomeView()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.collectionViewDelegate(delegate: self, dataSource: self)
    }
}

//MARK: - Delegate extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TopAlbumCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: TopAlbumCollectionViewCell.identifier, for: indexPath) as? TopAlbumCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 15) / 2)
        return CGSize(width: width, height: 150)
    }
}
