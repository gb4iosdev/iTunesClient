//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-13.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runTime: String
}

extension SongViewModel {
    
    init(song: Song) {
        self.title = song.censoredName
        
        //Track time is in milliseconds
        let timeInSeconds = song.trackTime/1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        self.runTime = "\(minutes): \(seconds)"
        
    }
}
