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
//        homeView.collectionViewDelegate(delegate: self, dataSource: self)
    }
}

//MARK: - Delegate extension
//extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return UICollectionViewCell()
//    }
//}
