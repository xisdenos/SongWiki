//
//  HomeViewController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 27/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        
        GenericAdapter.init(connection: NetworkCaller()).adapter(endpoint: "https://theaudiodb.p.rapidapi.com/mostloved.php?format=track") { (album: Result<[TopAlbums], Error>) in
            switch album {
            
            case .success(let albums):
                print("ok")
            case .failure(let error):
                print(error)
            }
        }
    }
}
