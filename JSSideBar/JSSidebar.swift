//
//  JSSidebar.swift
//  JSSidebar
//
//  Created by Jesse Seidman on 5/1/18.
//  Copyright © 2018 Jesse Seidman. All rights reserved.
//

import UIKit

public class JSSidebar: NSObject
{
  // vars
  // public
  public var sideBarView:SideBarView?   = nil
  
  // custom init
  public init(tableView:UITableView,
              indexPathArray:[IndexPath])
  {
    super.init()
    
    // make the side bar view
    sideBarView = SideBarView(tableView: tableView, indexPathArray: indexPathArray)
  }
}
