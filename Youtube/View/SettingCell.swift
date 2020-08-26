//
//  SettingCell.swift
//  Youtube
//
//  Created by JHK on 19. 09. 21..
//  Copyright © 2019 JHK. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name.rawValue
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(iconImageView)
        
        iconImageView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nameLabel.leadingAnchor, paddingTop: 0, paddingLeading: 8, paddingBottom: 0, paddingTrailing: 8, width: 30, height: 30)
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.anchor(top: nil, leading: iconImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 8, paddingBottom: 0, paddingTrailing: 0, width: 0, height: 0)
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
