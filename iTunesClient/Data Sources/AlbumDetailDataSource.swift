//
//  AlbumDetailDataSource.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-13.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
    
    private var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
    }
    
    //MARK: - DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songCell = tableView.dequeueReusableCell(withIdentifier: SongCell.reuseIdentifier, for: indexPath) as! SongCell
        
        let song = songs[indexPath.row]
        let cellViewModel = SongViewModel(song: song)
        songCell.configure(with: cellViewModel)
        
        return songCell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Tracks"
        default: return nil
        }
    }
    
    //MARK: - Helper Methods:
    func udpate(with songs: [Song]) {
        self.songs = songs
    }
}
