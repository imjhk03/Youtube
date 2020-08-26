//
//  VideoCell.swift
//  Youtube
//
//  Created by JHK on 19. 09. 19..
//  Copyright © 2019 JHK. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            setupThumbnailImage()
            setupProfileImage()
            
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                let subtitleText = "\(channelName) • \(numberFormatter.string(from: NSNumber(value: numberOfViews))!) • 2 years ago "
                subtitleTextView.text = subtitleText
            }
        }
    }
    
    func setupProfileImage() {
        if let profileImageUrl = video?.channel?.profileImageName {
            userProfileImageView.loadImage(urlString: profileImageUrl)
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageUrl = video?.thumbnailImageName {
            thumbnailImageView.loadImage(urlString: thumbnailImageUrl)
        }
    }
    
    let thumbnailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        label.numberOfLines = 0
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "TaylorSwiftVEVO • 1,604,6684,607 views • 2 years ago"
        textView.textContainerInset = .init(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
//    var titleLabelHeightConstraint: CGFloat = 20
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        addSubview(separatorView)
        
        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: userProfileImageView.topAnchor, trailing: trailingAnchor, paddingTop: 16, paddingLeading: 16, paddingBottom: 8, paddingTrailing: 16, width: 0, height: 0)
        
        userProfileImageView.anchor(top: thumbnailImageView.bottomAnchor, leading: leadingAnchor, bottom: separatorView.topAnchor, trailing: titleLabel.leadingAnchor, paddingTop: 8, paddingLeading: 16, paddingBottom: 16, paddingTrailing: 8, width: 44, height: 44)
        
        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: userProfileImageView.trailingAnchor, bottom: subtitleTextView.topAnchor, trailing: trailingAnchor, paddingTop: 8, paddingLeading: 8, paddingBottom: 4, paddingTrailing: 16, width: 0, height: 0)
        
        subtitleTextView.anchor(top: titleLabel.bottomAnchor, leading: userProfileImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 4, paddingLeading: 8, paddingBottom: 0, paddingTrailing: 16, width: 0, height: 30)
        
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0, width: 0, height: 1)
    }
    
}
