//
//  TableViewCell.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var title:String?
    var detailedDescription:String?
    var mainImage: UIImage?
    var imageUrl:String?
    
    
    
    var messageView:UITextView = {
        
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        return textView
    }()
  
    var mainImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleView : UILabel = {
      
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    func setUpImage(){
        if let imageUrl = imageUrl {
            mainImageView.loadImageFromUrlString(urlString: imageUrl)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(mainImageView)
        self.addSubview(titleView)
        self.addSubview(messageView)
        
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive  = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 100).isActive  = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let title = title{
            titleView.text = title
        }
        
        setUpImage()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 }
// NOTE: 
let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    func loadImageFromUrlString(urlString:String){
        
        image = nil
        let url = NSURL(string:urlString)
        let request = URLRequest(url:url! as URL)
        
        // NOTE: image caching if allready cached use that
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with:request) { data, response, error in
            guard let data = data else {return}

            DispatchQueue.main.async() {
            let imageToCache = UIImage(data: data)
                if let cacheImage = imageToCache {
                    imageCache.setObject(cacheImage, forKey: urlString as AnyObject)
                }
            self.image = imageToCache
            }
        }.resume()
 
    }
}
