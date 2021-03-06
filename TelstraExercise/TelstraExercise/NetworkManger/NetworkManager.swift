//
//  TableViewDataModel.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import UIKit

protocol DataModelDelegate: class {
    
    func  didRecieveDataUpdate(parsedData:Country)
    func  didFailDataUpdateWithError(error: Error)
}


class NetworkManager: NSObject {

    final let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    let country = [Country]()
    weak var delegate: DataModelDelegate?

    // MARK: API call
    func downloadJson() {
        
        //Setting upthe url
        guard let url = URL(string:url) else {return}
        
        //NSURLSession 
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            defer { self.dataTask = nil }
            guard let data = data else {return}
            
            let responseStrInISOLatin = String(data: data, encoding: String.Encoding.isoLatin1)
            guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                print("could not convert data to UTF-8 format")
                return
            }
            //Parsing data to model(TableViewModelItem)
            do {
                
                let country = try JSONDecoder().decode(Country.self, from: modifiedDataInUTF8Format)
                self.delegate?.didRecieveDataUpdate(parsedData: country)

        } catch let error {
            print("Error", error)
        }
    }
        self.dataTask?.resume()
}
   
}
