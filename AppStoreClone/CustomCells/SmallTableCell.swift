//
//  SmallTableCell.swift
//  AppStoreClone
//
//  Created by Windy on 25/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class SmallTableCell: UICollectionViewCell, ConfigureCellProtocol {
    
    static var reuseIdentifier: String = "SmallTableCell"
    
    let imageView = UIImageView()
    let name = UILabel()
    
    func configure(app: App) {
        imageView.image = UIImage(named: app.image)
        name.text = app.name
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        name.font = .preferredFont(forTextStyle: .title2)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, name])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

