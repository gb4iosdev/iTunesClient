//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Gavin Butler on 10-10-2018.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {
    
    private struct Constants {
        static let albumCellHeight: CGFloat = 80
    }
    
    var artist: Artist? {
        didSet {
            self.title = artist?.name
            dataSource.udpate(with: artist!.albums)
            tableView.reloadData()
        }
    }
    
    lazy var dataSource: AlbumListDataSource = {
        return AlbumListDataSource(albums: [], tableView: self.tableView)
    }()
    let client = ItunesAPIClient()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource

    }
    
    //MARK:- Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.albumCellHeight
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showAlbum" else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            let selectedAlbum = dataSource.album(at: selectedIndexPath)
            let albumDetailController = segue.destination as! AlbumDetailController
            
            client.lookupAlbum(withId: selectedAlbum.id) { album, error in
                albumDetailController.album = album
            }
        }
    }
    

}
