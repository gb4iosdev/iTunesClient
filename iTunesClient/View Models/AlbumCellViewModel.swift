//
//  AlbumCellViewModel.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-12.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import Foundation
import UIKit

struct AlbumCellViewModel {
    let artwork: UIImage
    let title: String
    let releaseDate: String
    let genre: String
}

extension AlbumCellViewModel {
    
    init(album: Album) {
        self.artwork = album.artworkState == .downloaded ? album.artwork! : UIImage(named: "AlbumPlaceholder")!
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM dd, yyyy"
        
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
