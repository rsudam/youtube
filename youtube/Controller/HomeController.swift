//
//  ViewController.swift
//  youtube
//
//  Created by Raghu Sairam on 12/11/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"

    var videos:[Video] = {
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Sapce"
        
        return [blankSpaceVideo]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        navigationController?.navigationBar.isTranslucent = false
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupMenuBar()
        setupNavBarItems()
    }
    
    func setupNavBarItems() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreBarItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMoreItem))
        navigationItem.rightBarButtonItems = [moreBarItem,searchBarItem]
    }
    
    @objc func handleSearch() {
        print("123")
    }
    
    @objc func handleMoreItem() {
        print("456")
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstrantsWithVisualFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstrantsWithVisualFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    
    
    //MARK: inbuilt methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 16 / 9 is aspect ratio for all the videos
        // -16 -16 is sustracted from the width becase of left and right spaces for the thumbnail image view
        let height = (view.frame.width - 16 - 16) * 9 / 16
        
        // now add remaining components size to the height constant
        // "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|"
        return CGSize(width: collectionView.frame.width, height: height + 16 + 8 + 44)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

