//
//  MainViewController.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,DataModelDelegate {
    
    
    let tableView:UITableView = {
        let tv = UITableView()
        // NOTE: - Registering the cell programmatically
        tv.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tv.allowsSelection = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
 
   /* lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action:
            #selector(MainViewController.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()*/
    
    var dataArray:Country?{
        //NOTE: Manually listening for reloading the tabelView
        didSet{
                DispatchQueue.main.async {
                self.navigationItem.title = (self.dataArray?.title)!
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }
    
    private let dataSource = TableViewDataModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataSource.delegate = self
        dataSource.requestData()
        tableViewSetup()
    }
    
    func tableViewSetup(){
        
        // NOTE:Adding tableView to the View
        self.view.addSubview(tableView)
        
    
        //self.tableView.addSubview(self.refreshControl)
        
        
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive  = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
     
       
        self.tableView.rowHeight = UITableViewAutomaticDimension
       // self.tableView?.estimatedRowHeight = 200
        
       
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegate methods
    func didRecieveDataUpdate(parsedData: Country) {
     
        var array = [Rows]()
        
        for row in parsedData.rows {
            
            array.append(row)
        }
        
       // let midpoint = array.count / 2
    
        dataArray = parsedData
        
     //  let   firstHalf = array[..<midpoint]
    //   let   secondHalf = array[midpoint...]


        
        
    }
    
    func didFailDataUpdateWithError(error: Error) {
        print("error: \(error.localizedDescription)")
        
    }
   /* @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
    
            refreshControl.endRefreshing()
    
    }*/
    

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
       
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.title = dataArray?.rows[indexPath.row].title
        cell.imageUrl = dataArray?.rows[indexPath.row].imageHref
        cell.detailedDescription = dataArray?.rows[indexPath.row].description
        cell.layoutSubviews()
        return cell
  }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return (dataArray?.rows.count)!
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
    
}


