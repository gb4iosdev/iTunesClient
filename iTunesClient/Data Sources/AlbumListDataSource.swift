//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-12.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {

    private var albums: [Album]
    
    let pendingOperations = PendingOperations()
    let tableView: UITableView
    
    init(albums: [Album], tableView: UITableView) {
        self.albums = albums
        self.tableView = tableView
        super.init()
    }
    
    // MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell
        
        let album = albums[indexPath.row]
        let viewModel = AlbumCellViewModel.init(album: album)
        albumCell.configure(with: viewModel)
        albumCell.accessoryType = .disclosureIndicator
        
        if album.artworkState == .placeHolder {
            downloadArtworkForAlbum(album, atIndexPath: indexPath)
        }
        
        return albumCell
    }
    
    //MARK: - Helper Methods:
    
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
    
    func udpate(with albums: [Album]) {
        self.albums = albums
    }
    
    func downloadArtworkForAlbum(_ album: Album, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            /// Already created an operation for this cell, and it's currently processing in the background
            return
        }
        
        let downloader = ArtworkDownloader(album: album)
        
        /// Define what we wan to happen when the download is complete:
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        /// Setup for tracking:
        pendingOperations.downloadsInProgress[indexPath] = downloader
        /// Add the download request to the queue
        pendingOperations.downloadQueue.addOperation(downloader)
        
    }
}
