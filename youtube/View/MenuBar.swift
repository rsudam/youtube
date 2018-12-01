//
//  MenuBar.swift
//  youtube
//
//  Created by Raghu Sairam on 28/11/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let imageNames = ["home","trending","subscriptions","account"]
    
    var homeController: HomeController?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstrantsWithVisualFormat(format: "H:|[v0]|", views: collectionView)
        addConstrantsWithVisualFormat(format: "V:|[v0]|", views: collectionView)
        
        let selectedIndexpath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexpath, animated: false, scrollPosition: .bottom)
        
        setupHorizontalBar()
    }
    
    var horizontalBarLeftAnchor: NSLayoutConstraint?
    
    func setupHorizontalBar() {
        let horizontalBar = UIView()
        horizontalBar.backgroundColor = UIColor(white: 0.9, alpha: 1)
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBar)
        //x, y, width, height
        horizontalBarLeftAnchor = horizontalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchor?.isActive = true
        horizontalBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let x = CGFloat(indexPath.row) * frame.width/4
//        horizontalBarLeftAnchor?.constant = x
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.layoutIfNeeded()
//        }, completion: nil)
        homeController?.scrollToMenuIndex(menuIndex: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
