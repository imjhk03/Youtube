//
//  SubscriptionCell.swift
//  Youtube
//
//  Created by JHK on 19. 09. 21..
//  Copyright © 2019 JHK. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
}
