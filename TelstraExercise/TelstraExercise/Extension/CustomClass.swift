//
//  CustomClass.swift
//  TelstraExercise
//
//  Created by sarath on 29/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//


// NOTE: Not using this class 
import Foundation
import UIKit

let imageCache = NSCache<NSString, AnyObject>()
class CustomImageView: UIImageView {
    
    var imgeUrlString:String?
    
    func loadImageFromUrlString(urlString:String){
        
        imgeUrlString = urlString
        let url = NSURL(string:urlString)
        let request = URLRequest(url:url! as URL)
        
        // Check for cached image
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) as? UIImage{
            self.image = imageFromCache
            return
        }
        // If not, download image from url
        URLSession.shared.dataTask(with:request) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            guard let data = data else {return}
            DispatchQueue.main.async() {
                let imageToCache = UIImage(data: data)
                if imageToCache != nil{
                    // NOTE: Avoiding image overlapping
                    if self.imgeUrlString == urlString {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                }
         
            }
            }.resume()
        
    }
}


