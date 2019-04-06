//
//  ArtworkDownloader.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-20.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import Foundation
import UIKit

class ArtworkDownloader: Operation {
    ///Download album arwork and assign it back to the album
    
    let album: Album
    
    init(album: Album) {
        self.album = album
        super.init()
    }
    
    override func main() {
        ///Check to see if the operation has been cancelled
        if self.isCancelled {
            return
        }
        
        ///Download artwork associated with the album.  Captured by the artworkUrl property on the album instance
        guard let url = URL(string: album.artworkUrl) else {
            return
        }
        
        // Download image
        // save to cache with key url
        // display image SDWEbImage
        
        
        
        guard let imageData = try? Data(contentsOf: url) else { return }
        
        if self.isCancelled {
            return
        }
        
        if imageData.count > 0 {    ///Assume data is valid
            album.artwork = UIImage(data: imageData)
            album.artworkState = .downloaded
            print("album.artworkState for album title: \(album.name) is: \(album.artworkState)")
        } else {
            album.artworkState = .failed
        }
    }
}
