//
//  HeaderCell.swift
//  AppStoreClone
//
//  Created by Windy on 25/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SectionHeader"
    
    let title = UILabel()
    let subtitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.textColor = .label
        title.font = .preferredFont(forTextStyle: .title2)
        
        subtitle.textColor = .secondaryLabel
        
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .tertiaryLabel
        
        let stackView = UIStackView(arrangedSubviews: [separator, title, subtitle])
        stackView.axis = .vertical
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        stackView.setCustomSpacing(10, after: separator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
