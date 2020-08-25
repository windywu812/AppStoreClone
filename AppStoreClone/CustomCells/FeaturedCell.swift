//
//  LargeSectionCell.swift
//  AppStoreClone
//
//  Created by Windy on 24/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell, ConfigureCellProtocol {
    
    static var reuseIdentifier: String = "LargeSectionCell"
    
    var tagline: UILabel!
    var name: UILabel!
    var subtitle: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tagline = UILabel()
        tagline.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .bold))
        tagline.textColor = .systemBlue
        
        name = UILabel()
        name.font = UIFont.preferredFont(forTextStyle: .title2)
        name.textColor = .label
        
        subtitle = UILabel()
        subtitle.textColor = .secondaryLabel
        subtitle.font = UIFont.preferredFont(forTextStyle: .title2)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel
        
        let stackView = UIStackView(arrangedSubviews: [separator, tagline, name, subtitle, imageView])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
                
        stackView.setCustomSpacing(10, after: separator)
        stackView.setCustomSpacing(-20, after: subtitle)
    }
    
    func configure(app: App) {
        tagline.text = app.tagline
        name.text = app.name
        subtitle.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

