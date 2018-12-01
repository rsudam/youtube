//
//  ApiService.swift
//  youtube
//
//  Created by Raghu Sairam on 01/12/18.
//  Copyright © 2018 Raghu Sairam. All rights reserved.
//

import UIKit

class ApiService: NSObject {

    static var sharedApiInstance = ApiService()
    let baseUrl: String = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchSubscriptionData(completion:@escaping ([Video]) -> ()) {
        fetchVideoDataUsingURLString(urlString: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    
    func fetchTrendingData(completion:@escaping ([Video]) -> ()) {
        fetchVideoDataUsingURLString(urlString: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchVideoData(completion:@escaping ([Video]) -> ()) {
        fetchVideoDataUsingURLString(urlString: "\(baseUrl)/home.json", completion: completion)
        
    }
    
    func fetchVideoDataUsingURLString(urlString: String, completion:@escaping ([Video]) -> ()) {
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, resonce, error) in
            if error != nil {
                print(error!)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                
                for dictionary in json as! [[String:Any]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    video.duration = dictionary["duration"] as? NSNumber
                    video.numberOfView = dictionary["number_of_views"] as? NSNumber
                    
                    if let channelDict = dictionary["channel"] as? [String:Any] {
                        let channel = Channel()
                        channel.name = channelDict["name"] as? String
                        channel.profileImageName = channelDict["profile_image_name"] as? String
                        video.channel = channel
                    }
                    
                    videos.append(video)
                }
                
                DispatchQueue.main.async {
                    completion(videos)
                }
                
            }catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
}
