//
//  TableViewDataModelItem.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import Foundation


struct Country: Decodable {
    let title : String
    let rows: [Rows]
}
struct Rows:Decodable {
    
    let title:String?
    let description:String?
    let imageHref:String?
    
   /*enum CodingKeys: String, CodingKey {
        case subTitle    = "title"
        case description = "description"
        case imageUrl    = "imageHref"
    }*/
}
