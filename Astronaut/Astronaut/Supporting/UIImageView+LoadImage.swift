//
//  UIImageView+imageFromUrl.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import UIKit

/**
 Quick and simple lazy image loading. In practice, we could use some library like SDWebImage or build something of our own with proper caching mechanism
 */
extension UIImageView {
    
    func imageFromUrl(urlString: String?, placeHolderImage: UIImage?) {
        
        if self.image == nil {
            self.image = placeHolderImage
        }
        
        guard let urlString = urlString else {
            return // urlString nil, can't load
        }
        
        // perform network request
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
