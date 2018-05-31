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
    
    // MARK: UI component setup
    var messageView:UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.numberOfLines = 0
        textView.lineBreakMode = NSLineBreakMode.byWordWrapping
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.lightGray
        return textView
    }()
    // If yor using custom image loading func then change-to CustomImageView
    //STEP 2: change uimageview to subclass of CustomImageView class.
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
    
    // Resting image to nil
    override func prepareForReuse()  {
        mainImageView.image = nil
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
        
        // Image view constraint
        if #available(iOS 9.0, *) {
            let marginGuide = contentView.layoutMarginsGuide
            [
            mainImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            mainImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: titleView.topAnchor)
            ].forEach{ $0.isActive = true}
            // Title view constraint
            [
            titleView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            titleView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor,constant:10),
            titleView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor)].forEach{ $0.isActive = true}
            // Description view constraint
            [
            messageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            messageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor),
            messageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            messageView.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant:5)].forEach{ $0.isActive = true}
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    // Displaying data to the UI components
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let title = title{
            titleView.text = title
        }
        if let description = detailedDescription {
            messageView.text = description
        }
        if let imageUrl = imageUrl {
            
            // To use custom method for image loading - 2 Steps
            
            // STEP 1: uncomment below code & comment line no:93
            //mainImageView.loadImageFromUrlString(urlString: imageUrl)
            
            //SDWeb library
            mainImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder.png"))
            
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

