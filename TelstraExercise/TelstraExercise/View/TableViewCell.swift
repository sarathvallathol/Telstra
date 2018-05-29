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
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive  = true
        mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 100).isActive  = true
       // mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // NOTE: Title view constraint
        titleView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleView.bottomAnchor.constraint(equalTo: messageView.topAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        // NOTE: Description view constraint
        messageView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
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

