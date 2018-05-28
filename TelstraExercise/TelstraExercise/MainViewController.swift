//
//  MainViewController.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
 
    private var dataArray:Country?
    private let dataSource = TableViewDataModel()


    var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Frame for tableView
        let frame = self.view.frame
        tableView = UITableView(frame: frame)
        //Adding tableView to the View
        self.view.addSubview(tableView!)
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.estimatedRowHeight = 200
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
          dataSource.requestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MainViewController: DataModelDelegate {
    
    func didFailDataUpdateWithError(error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
    func didRecieveDataUpdate(parsedData:Country) {
        dataArray = parsedData
        print(dataArray!)
    }
}
