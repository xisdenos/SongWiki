//
//  DetailViewController.swift
//  SongWiki
//
//  Created by Lucas Pinto on 31/08/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var detailView: DetailView = DetailView()
    var detailViewModel: DetailViewModel
    
    init(with info: Info) {
        self.detailViewModel = DetailViewModel(info: info)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailView.setUpCell(albumInfo: detailViewModel)
    }
}
