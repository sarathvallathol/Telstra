//
//  MainViewController.swift
//  TelstraExerciseTests
//
//  Created by sarath on 30/05/18.
//  Copyright © 2018 com.sarath.telstra. All rights reserved.
//

import XCTest

@testable import TelstraExercise
class MainViewControllerTest: XCTestCase {
   
    let controller = MainViewController()
     let cell  = TableViewCell()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    // MARK: Table view test cases
    func conformingToProtocol(){
        XCTAssertTrue(controller.conforms(to:UITableViewDataSource.self))
    }
    
    func testThatTableViewLoads(){
        XCTAssertNotNil(controller.tableView, "TableView not initiated")
    }
    
    func testParentViewHasTableViewSubview()
    {
    let subviews = controller.view.subviews;
        XCTAssertTrue(subviews.contains(controller.tableView) , file: "View does not have a table subview")
    }
    
    // Checking Url is correct or not
    func testUrl(){
        let url =  "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let manger = NetworkManager()
        XCTAssertEqual(url, manger.url)
        
    }

   
    
    
    
}
