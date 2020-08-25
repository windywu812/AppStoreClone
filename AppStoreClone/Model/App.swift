//
//  App.swift
//  AppStoreClone
//
//  Created by Windy on 24/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import Foundation

struct App: Decodable, Hashable {
    let id: Int
    let tagline: String
    let name: String
    let subheading: String
    let image: String
    let iap: Bool
}
