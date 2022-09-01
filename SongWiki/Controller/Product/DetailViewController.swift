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
    
    override func loadView() {
        super.loadView()
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
