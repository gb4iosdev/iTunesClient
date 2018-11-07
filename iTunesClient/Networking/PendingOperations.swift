//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-20.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath : Operation]()
    let downloadQueue = OperationQueue()
}
