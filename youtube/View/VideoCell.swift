//
//  HomeViewCell.swift
//  youtube
//
//  Created by Raghu Sairam on 13/11/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    let thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "taylor_swift_blank_space")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let userProfileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "taylor_swift_profile")
        iv.layer.cornerRadius = 22
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift Blank Space"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
        textView.textColor = UIColor.lightGray
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let separateLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separateLineView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
        
        
        //horizontal constraints
        addConstrantsWithVisualFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstrantsWithVisualFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        
        //vertical constraints
        addConstrantsWithVisualFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImageView,separateLineView)
        
        addConstrantsWithVisualFormat(format: "H:|[v0]|", views: separateLineView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))

        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))

        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))

        //height constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
        ///top constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        
        //left constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        //right constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        //height constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        
    }
    
    func setupViews_1() {
        
        addSubview(separateLineView)
        //x,y,width,height
        separateLineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separateLineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separateLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separateLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(userProfileImageView)
        //x,y,width,height
        userProfileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        userProfileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        userProfileImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        userProfileImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addSubview(titleLabel)
        //x,y,width,height
        titleLabel.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: userProfileImageView.topAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(subTitleTextView)
        //x,y,width,height
        subTitleTextView.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8).isActive = true
        subTitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        subTitleTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        subTitleTextView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        addSubview(thumbnailImageView)
        //x,y,width,height
        thumbnailImageView.bottomAnchor.constraint(equalTo: userProfileImageView.topAnchor, constant: -8).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        thumbnailImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        thumbnailImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
    }
}


