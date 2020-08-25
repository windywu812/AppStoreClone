//
//  CellProtocol.swift
//  AppStoreClone
//
//  Created by Windy on 24/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import Foundation

protocol ConfigureCellProtocol {
    static var reuseIdentifier: String { get }
    func configure(app: App)
}
