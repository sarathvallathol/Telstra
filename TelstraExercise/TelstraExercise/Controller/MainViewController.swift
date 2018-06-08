//
//  MainViewController.swift
//  TelstraExercise
//
//  Created by sarath on 28/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,DataModelDelegate {
    
    // class stuff here
    private let dataSource = NetworkManager()
    
    // MARK: tableview closure
    let tableView:UITableView = {
        let tv = UITableView()
        // NOTE: - Registering the cell programmatically
        tv.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tv.allowsSelection = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        return tv
    }()
    
    // MARK: Refreshcontroller closure
     lazy var refreshControl: UIRefreshControl = {
     let refreshControl = UIRefreshControl()
     refreshControl.addTarget(self, action:
     #selector(MainViewController.handleRefresh(_:)),
     for: UIControlEvents.valueChanged)
     
     refreshControl.tintColor = UIColor.red
     
     return refreshControl
     }()
    
    // MARK: Listener
    var dataArray:Country?{
        didSet{
            DispatchQueue.main.async {
                self.navigationItem.title = (self.dataArray?.title)!
              
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        dataSource.delegate = self
        tableViewSetup()
    }
    override func viewDidAppear(_ animated: Bool) {
        // Api call
        dataSource.downloadJson()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Tableview setup
    func tableViewSetup(){
        
        // Adding tableView to the View
        self.view.addSubview(tableView)
        // Constraints for table view
        if #available(iOS 9.0, *) {
            [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)].forEach{ $0.isActive = true }
        } else {
            // Fallback on earlier versions
        }
        
        //NOTE : Dimension for tableview cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        

        // Refreshcontroller
        self.tableView.addSubview(self.refreshControl)
    }
 
    //MARK: Protocol methods
    func didRecieveDataUpdate(parsedData: Country) {

        dataArray = parsedData
  
    }
    
    func didFailDataUpdateWithError(error: Error) {
        print("error: \(error.localizedDescription)")
        
    }
    
    // MARK: Refresh method
     @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
     dataSource.downloadJson()
     refreshControl.endRefreshing()
     }
 
}
// MARK: - Table View Delegate
extension MainViewController: UITableViewDelegate {
    
}
// MARK: - Table View Data Source
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cell 
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.title = dataArray?.rows[indexPath.row].title
        cell.imageUrl = (dataArray?.rows[indexPath.row].imageHref)
        cell.detailedDescription = dataArray?.rows[indexPath.row].description
        cell.layoutSubviews()

        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if dataArray != nil {
        return dataArray!.rows.count
        }else{
            return 0
        }
    }
}


