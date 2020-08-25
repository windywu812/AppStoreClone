//
//  Section.swift
//  AppStoreClone
//
//  Created by Windy on 24/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import Foundation

struct Section: Decodable, Hashable {
    let id: Int
    let type: String
    let title: String
    let subtitle: String
    let items: [App]
}
