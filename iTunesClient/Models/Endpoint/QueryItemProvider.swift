//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by Gavin Butler on 2018-10-15.
//  Copyright © 2018 Gavin Butler. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
