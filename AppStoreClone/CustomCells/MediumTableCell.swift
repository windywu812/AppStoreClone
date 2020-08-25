//
//  MediumTableCell.swift
//  AppStoreClone
//
//  Created by Windy on 25/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class MediumTableCell: UICollectionViewCell, ConfigureCellProtocol {
    
    static var reuseIdentifier: String = "MediumTableCell"
    
    let image = UIImageView()
    let name = UILabel()
    let subtitle = UILabel()
    let button = UIButton(type: .system)
    
    func configure(app: App) {
        image.image = UIImage(named: app.image)
        name.text = app.name
        subtitle.text = app.subheading
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        name.font = UIFont.preferredFont(forTextStyle: .headline)
        name.textColor = .label
        
        subtitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitle.textColor = .secondaryLabel
        
        button.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)
        
        let textStackView = UIStackView(arrangedSubviews: [name, subtitle])
        textStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [image, textStackView, button])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
