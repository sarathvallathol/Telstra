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
    let cellIdentifier = "cell" //Cell dequeue identifer
    
    // MARK: tableview closure
    let tableView:UITableView = {
        let tv = UITableView()
        tv.allowsSelection = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        return tv
    }()
    
    // MARK: Refreshcontroller closure
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:#selector(MainViewController.handleRefresh(_:)),for:UIControlEvents.valueChanged)
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
        
        // NOTE: - Registering the cell
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
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
extension MainViewController: UITableViewDelegate {}
// MARK: - Table View Data Source
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cell 
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        cell.title = dataArray?.rows[indexPath.row].title
        cell.imageUrl = (dataArray?.rows[indexPath.row].imageHref)
        cell.detailedDescription = dataArray?.rows[indexPath.row].description
        cell.layoutSubviews()
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = dataArray == nil ? 0 : dataArray!.rows.count
        return numberOfRows
    }
}


