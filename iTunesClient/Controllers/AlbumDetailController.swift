//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-13.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    var album: Album? {
        didSet {
            if let album = album {
                configure(with: album)
                dataSource.udpate(with: album.songs)
                tableView.reloadData()
            }
        }
    }
    
    var dataSource: AlbumDetailDataSource = AlbumDetailDataSource(songs: [])
    
    @IBOutlet weak var artWorkImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let album = album {
            configure(with: album)
        }
        
        tableView.dataSource = dataSource
    }
    
    func configure(with album: Album) {
        
        let viewModel = AlbumDetailViewModel.init(album: album)
        
        // <Add implementation for arwork imageView>
        
        self.albumTitleLabel.text = viewModel.title
        self.albumGenreLabel.text = viewModel.genre
        self.albumReleaseDateLabel.text = viewModel.releaseDate
    }

}
