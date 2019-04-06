//
//  AlbumDetailViewModel.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-13.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import Foundation
import UIKit

struct AlbumDetailViewModel {
    let artwork: UIImage
    let title: String
    let releaseDate: String
    let genre: String
}

extension AlbumDetailViewModel {
    
    init(album: Album) {
        print("album.artworkState for album title: \(album.name) is: \(album.artworkState)")
        self.artwork = album.artworkState == .downloaded ? album.artwork! : UIImage(named: "AlbumPlaceholder")!
        //self.artwork = album.artwork!
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM dd, yyyy"
        
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
