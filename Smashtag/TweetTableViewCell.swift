//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by Salim Mimouni on 17/05/2016.
//  Copyright © 2016 Salim Mimouni. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell
{
    
    var tweet: Tweet? {
        
        didSet {
            updateUI()
        }
    }

    @IBOutlet weak var tweetProfileImageView: UIImageView!
    
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    func updateUI() {
        
        tweetTextLabel?.attributedText = nil
        tweetScreenNameLabel?.text = nil
        tweetProfileImageView?.image = nil
        
        
        if let tweet = self.tweet {
            
            tweetTextLabel?.text = tweet.text
            if tweetTextLabel?.text != nil {
                for _ in tweet.media {
                    
                    tweetTextLabel.text! += " 📷"
                    
                }
            }
            
            tweetScreenNameLabel?.text = "\(tweet.user)"
            
            if let profileImageURL = tweet.user.profileImageURL {
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    
                    if let imageData = NSData(contentsOfURL:profileImageURL) {
                        self.tweetProfileImageView?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
}
