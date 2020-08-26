//
//  Video.swift
//  Youtube
//
//  Created by JHK on 19. 09. 19..
//  Copyright © 2019 JHK. All rights reserved.
//

import UIKit

class Video: Decodable {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: Int?
    var uploadDate: Date?
    
    var channel: Channel?
    
}

class Channel: Decodable {
    var name: String?
    var profileImageName: String?
}
