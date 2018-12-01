//
//  SettingsLauncher.swift
//  youtube
//
//  Created by Raghu Sairam on 28/11/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var blackView: UIView?
    let cellId = "cellId"
    let cellHeight: CGFloat = 50
    let settings: [Setting] = {
        return [Setting(name: .Settings, imageName: "settings"), Setting(name: .TermsPrivacy, imageName: "privacy"),
                Setting(name: .SendFeedback, imageName: "feedback"), Setting(name: .Help, imageName: "help"),
                Setting(name: .SwitchAccount, imageName: "switch_account"), Setting(name: .Cancel, imageName: "cancel")]
    }()
    
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    var homeController: HomeController?
    
    func showSettings() {
        blackView = UIView()
        blackView!.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(blackView!)
            window.addSubview(collectionView)
            
            blackView?.frame = (window.frame)
            
            let height:CGFloat = CGFloat(settings.count) * cellHeight
            
            let y = (window.frame.height) - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            blackView?.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView?.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss() {
        let setting = Setting(name: .Cancel, imageName: "")
        dismissSettingsAndPresentSettingsController(setting: setting)
    }
    
    func dismissSettingsAndPresentSettingsController(setting: Setting) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.blackView?.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
            
        }) { (completed:Bool) in
            if setting.name != .Cancel {
                self.homeController?.showSettingsController(setting: setting)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingsCell
        cell.setting = settings[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let setting = settings[indexPath.row]
        dismissSettingsAndPresentSettingsController(setting: setting)
    }
    
    override init() {
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
}
