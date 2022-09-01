//
//  HomeViewController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 27/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView: HomeView = HomeView()
    var homeViewModel: HomeViewModel = HomeViewModel()
    var passDataToDetail: ((Info) -> Void)?
    
    override func loadView() {
        super.loadView()
        self.view = homeView
        
        homeViewModel.afterApiCall = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.homeView.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.collectionViewDelegate(delegate: self, dataSource: self)
        homeViewModel.fetchAlbums()
    }
}

//MARK: - Delegate extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(homeViewModel.albumsCount)
        return homeViewModel.albumsCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TopAlbumCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: TopAlbumCollectionViewCell.identifier, for: indexPath) as? TopAlbumCollectionViewCell
        cell?.setUpCell(albumInfo: homeViewModel.albumsList[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 15) / 2)
        return CGSize(width: width, height: 235)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let width = ((collectionView.frame.width - 15) / 2)
        return CGFloat(20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.passDataToDetail?(homeViewModel.albumsList[indexPath.row])
    }
}

