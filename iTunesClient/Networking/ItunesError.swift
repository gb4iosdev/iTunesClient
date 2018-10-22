//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-15.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
