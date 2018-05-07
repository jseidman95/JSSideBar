//
//  TableViewController.swift
//  JSSidebar
//
//  Created by Jesse Seidman on 5/1/18.
//  Copyright © 2018 Jesse Seidman. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController
{
  public var sideBar:JSSidebar? = nil
  public var didAdd = false
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    self.tableView.showsVerticalScrollIndicator = false
    self.tableView.separatorStyle = .none
  }

  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int
  {
    return 1
  }

  override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int
  {
    return 100
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

    // Configure the cell...
    cell.textLabel?.text = "\(indexPath.row)"
  
    return cell
  }
  
  override func viewDidLayoutSubviews()
  {
    var indexPathArray = [IndexPath]()
    
    for i in stride(from: 0, to: 100, by: 10)
    {
      indexPathArray.append(IndexPath(row: i, section: 0))
    }
    
    if !didAdd
    {
      sideBar = JSSidebar(tableView: self.tableView,
                          indexPathArray: indexPathArray)
      didAdd = true
    }
  }
}
