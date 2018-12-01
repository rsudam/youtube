//
//  TrendingCell.swift
//  youtube
//
//  Created by Raghu Sairam on 01/12/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
 
    override func fetchVideoData() {
        ApiService.sharedApiInstance.fetchTrendingData { (videos:[Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
}
