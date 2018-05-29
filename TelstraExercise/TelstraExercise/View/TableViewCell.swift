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
        //textView.backgroundColor = .red
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        return textView
    }()
  
    var mainImageView: CustomImageView = {
        var imageView = CustomImageView()
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
      
        // NOTE: Image view constraint
        if #available(iOS 9.0, *) {
            if #available(iOS 11.0, *) {
                mainImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            mainImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive  = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            if #available(iOS 11.0, *) {
                mainImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            mainImageView.widthAnchor.constraint(equalToConstant: 100).isActive  = true
        } else {
            // Fallback on earlier versions
        }
       // mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // NOTE: Title view constraint
        if #available(iOS 9.0, *) {
            titleView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            titleView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            titleView.bottomAnchor.constraint(equalTo: messageView.topAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            if #available(iOS 11.0, *) {
                titleView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
        
        // NOTE: Description view constraint
        if #available(iOS 9.0, *) {
            messageView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            if #available(iOS 11.0, *) {
                messageView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            if #available(iOS 11.0, *) {
                messageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            messageView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let title = title{
            titleView.text = title
        }
        if let description = detailedDescription {
            messageView.text = description
        }
        //NOTE: Calling image asynchronously
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

