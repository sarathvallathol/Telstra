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
    
    var messageView:UILabel = {
        var textView = UILabel()
        //textView.backgroundColor = .red
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.numberOfLines = 0
        textView.lineBreakMode = NSLineBreakMode.byWordWrapping
        textView.font = UIFont.systemFont(ofSize: 12)
          //  UIFont(name: "Avenir-Book", size: 12)
        textView.textColor = UIColor.lightGray
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
            // print("URL",imageUrl)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainImageView)
        contentView.addSubview(titleView)
        contentView.addSubview(messageView)
        
        // NOTE: Image view constraint
        
        let marginGuide = contentView.layoutMarginsGuide
        
        mainImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
       // mainImageView.widthAnchor.constraint(equalToConstant: 50).isActive  = true
        mainImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
       /* mainImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        
        mainImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive  = true
        mainImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 50).isActive  = true
        mainImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
 */
        
        

        titleView.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor).isActive = true
        titleView.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor).isActive = true

      /*  // NOTE: Title view constraint
        titleView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        titleView.bottomAnchor.constraint(equalTo: messageView.topAnchor,constant:10).isActive = true
        titleView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true*/
        
       
       /* // NOTE: Description view constraint
        messageView.leftAnchor.constraint(equalTo: mainImageView.rightAnchor).isActive = true
       /* messageView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant:10).isActive = true*/
        
        messageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 15).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 15).isActive = true*/
        
        messageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        messageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
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

