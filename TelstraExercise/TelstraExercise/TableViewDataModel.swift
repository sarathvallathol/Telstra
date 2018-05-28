//
//  TableViewDataModel.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import UIKit

protocol DataModelDelegate: class {
    
    func  didReciveDataUpdate(parsedData:Country)
    func  didFaileWithError(error:Error)
}
class TableViewDataModel: NSObject {

    weak var delegate: DataModelDelegate?

    // MARK: API call
    func requestData() {
        
        //Setting up the url
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else {return}
        
        //NSURLSession 
        let task = URLSession.shared.dataTask(with: url) { (data, response, error)
            in
            guard let data = data else {
                print(error!)
                return
            }
            
            //Parsing data to model(TableViewModelItem)
            guard let jsonResponse = try? JSONDecoder().decode(Country.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return
            }
            self.updateResponse(response: jsonResponse)
        }
        
        task.resume()
    }
    
    // MARK: delegate method
    func updateResponse(response:Country){
        delegate?.didReciveDataUpdate(parsedData: response)
        
    }
    
}
