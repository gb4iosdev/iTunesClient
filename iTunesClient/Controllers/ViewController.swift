//
//  ViewController.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-07.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let _ = Itunes.search(term: "taylor swift", media: .music(entity: .musicArtist, attribute: .artistTerm))
        //print(searchEndpoint.request)
        
        //print("***********")
        
        let _ = Itunes.lookup(id: 159260351, entity: MusicEntity.album)
        //print(lookupEndpoint.request)
    }


}

