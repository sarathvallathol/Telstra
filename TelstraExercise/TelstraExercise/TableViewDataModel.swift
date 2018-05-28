//
//  TableViewDataModel.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import UIKit

protocol DataModelDelegate: class {
    
    func  didReciveDataUpdate()
    func  didFaileWithError(error:Error)
}
class TableViewDataModel: NSObject {

    
    // MARK: API call
    
    func requestData() {
        
        //API call
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error)
            in
            guard let data = data else {
                print(error!)
                return
            }
            
            guard let jsonResponse = try? JSONDecoder().decode(movie.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return
            }
            print(jsonResponse.movie_char!)
            self.updateResponse(response: jsonResponse)
        }
        
        task.resume()
    }
    
}
