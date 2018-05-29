//
//  MainViewController.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,DataModelDelegate {
    
 
    var dataArray:Country?{
        
        didSet{
           
            
            DispatchQueue.main.async {
                
                self.navigationItem.title = (self.dataArray?.title)!
                self.tableView?.delegate = self
                self.tableView?.dataSource = self
                self.tableView?.reloadData()
            }
        }
    }
    private let dataSource = TableViewDataModel()

    var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataSource.delegate = self
        dataSource.requestData()
        
        tableViewSetup()
       
    }
    
    func tableViewSetup(){
        
        
        // NOTE:Frame for tableView
        let frame = self.view.frame
        tableView = UITableView(frame: frame)
        
       
        
        // NOTE:Adding tableView to the View
        self.view.addSubview(tableView!)
        self.tableView?.rowHeight = UITableViewAutomaticDimension
      //  self.tableView?.estimatedRowHeight = 200
        
        // NOTE: - Registering the cell programmatically
        self.tableView?.register(TableViewCell.self, forCellReuseIdentifier: "cell")
       
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegate methods
    func didRecieveDataUpdate(parsedData: Country) {
        
        dataArray = parsedData
        
    }
    
    func didFailDataUpdateWithError(error: Error) {
        print("error: \(error.localizedDescription)")
        
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
// MARK: - Table View Delegate
extension MainViewController: UITableViewDelegate {
    
}
// MARK: - Table View Data Source
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            
        cell.title = dataArray?.rows[indexPath.row].title
        cell.imageUrl = dataArray?.rows[indexPath.row].imageHref
        cell.detailedDescription = dataArray?.rows[indexPath.row].description
        cell.layoutSubviews()
        return cell
  }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return (dataArray?.rows.count)!
    }

    
    
}


