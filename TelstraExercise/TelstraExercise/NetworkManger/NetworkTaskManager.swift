//
//  NetworkTaskManager.swift
//  TelstraExercise
//
//  Created by sarath on 06/06/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import Foundation
class TaskManager {
    
    static let shared = TaskManager()
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
}
