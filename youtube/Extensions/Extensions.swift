//
//  Extensions.swift
//  youtube
//
//  Created by Raghu Sairam on 28/11/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstrantsWithVisualFormat(format: String, views: UIView...) {
        var viewsDictionary = [String:UIView]()
        
        for (index,view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            let key = "v\(index)"
            viewsDictionary[key] = view
            
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

let imageCache = NSCache<NSString, UIImage>()

class CustomUIImageView: UIImageView {
    
    var imageUrl: String?
    
    func uploadImageUsingUrlString(urlString: String) {
        
        self.image = nil
        self.imageUrl = urlString
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            
            if error != nil {
                print(error!)
                return
            }            
            DispatchQueue.main.async {
                if let imageToCache = UIImage(data: data!) {
                    if self.imageUrl == urlString {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache, forKey: urlString as NSString)
                }
            }
            
        }.resume()
    }
}
