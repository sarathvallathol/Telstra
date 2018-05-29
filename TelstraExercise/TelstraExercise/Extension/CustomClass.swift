//
//  CustomClass.swift
//  TelstraExercise
//
//  Created by sarath on 29/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()
class CustomImageView: UIImageView {
    
    var imgeUrlString:String?
    
    func loadImageFromUrlString(urlString:String){
        
        imgeUrlString = urlString
        let url = NSURL(string:urlString)
        let request = URLRequest(url:url! as URL)
        
        // NOTE: image caching if allready cached use that
        
        
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with:request) { data, response, error in
            guard let data = data else {return}
            
            DispatchQueue.main.async() {
                let imageToCache = UIImage(data: data)
                if imageToCache != nil{
                    //NOTE: Avoiding image overlapping
                    if self.imgeUrlString == urlString {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                }
         
            }
            }.resume()
        
    }
}


