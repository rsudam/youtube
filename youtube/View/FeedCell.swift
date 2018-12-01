//
//  FeedCell.swift
//  youtube
//
//  Created by Raghu Sairam on 01/12/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    var videos: [Video]?
    let cellId = "cellId"
    func fetchVideoData() {
        ApiService.sharedApiInstance.fetchVideoData { (videos:[Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        fetchVideoData()
        
        addSubview(collectionView)
        addConstrantsWithVisualFormat(format: "H:|[v0]|", views: collectionView)
        addConstrantsWithVisualFormat(format: "V:|[v0]|", views: collectionView)
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell

        cell.video = videos?[indexPath.row]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // 16 / 9 is aspect ratio for all the videos
        // -16 -16 is sustracted from the width becase of left and right spaces for the thumbnail image view
        let height = (frame.width - 16 - 16) * 9 / 16

        // now add remaining components size to the height constant
        // "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|"
        return CGSize(width: collectionView.frame.width, height: height + 16 + 8 + 88)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
