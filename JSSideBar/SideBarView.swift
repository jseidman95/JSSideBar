//
//  SideBarView.swift
//  JSSidebar
//
//  Created by Jesse Seidman on 5/1/18.
//  Copyright © 2018 Jesse Seidman. All rights reserved.
//

import UIKit
import JSRotatingView

public class SideBarView: JSRotatingView, JSRotationDelegate
{
  // var
  // public
  public var lineLayer = CAShapeLayer()
  public var jumpPanGesture:SensitiveScrollRecognizer = SensitiveScrollRecognizer()
  public var indexPathArray:[IndexPath] = []
  public var parentTableView:UITableView? = nil
  
  // custom init
  public init(tableView:UITableView, indexPathArray:[IndexPath])
  {
    super.init(frame: tableView.frame)
    
    // pass in index path array
    self.indexPathArray = indexPathArray

    // initialize view in TV
    startUp(tableView: tableView)
  }
  
  public required init?(coder aDecoder: NSCoder)
  {
    fatalError("init(coder:) has not been implemented")
  }
  
  // overridden funcs
  public override func draw(_ rect: CGRect)
  {
    // remove previous layer
    lineLayer.removeFromSuperlayer()
    print("drawing")
    // move line to start location
    let linePath = UIBezierPath()
    linePath.move(to: CGPoint(x: self.frame.width / 2,
                              y: self.frame.minY + self.frame.height * 0.1))
    
    // draw line
    linePath.addLine(to: CGPoint(x: self.frame.width / 2,
                                 y: self.frame.maxY - self.frame.height * 0.1))
    
    // set shape layer data
    lineLayer.strokeColor = UIColor.gray.cgColor
    
    // add path to shape layer
    lineLayer.path = linePath.cgPath

    //add layer
    self.layer.addSublayer(lineLayer)
  }
  
  // funcs
  // private
  private func startUp(tableView:UITableView)
  {
    // add the actual side bar
    addSideBarView(tableView: tableView)
    
    // add the pan gesture
    jumpPanGesture.addTarget(self,
                             action: #selector(handlePan))
    self.addGestureRecognizer(jumpPanGesture)
    
    // set the parent table view
    parentTableView = tableView
    
    // set the rotation manager
    self.rotationDelegate = self
  }
  
  private func addSideBarView(tableView:UITableView)
  {
    // get the superview of the tableview
    if let tableSuper = tableView.superview
    {
      // add the view to the superview of the table
      tableSuper.addSubview(self)
      
      // set side bar view data
      self.backgroundColor = UIColor.clear
      
      // make side bar view constraints
      self.translatesAutoresizingMaskIntoConstraints = false
      self.rightAnchor.constraint(equalTo:  tableView.rightAnchor).isActive  = true
      self.topAnchor.constraint(equalTo:    tableView.topAnchor).isActive    = true
      self.bottomAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
      self.widthAnchor.constraint(equalTo: tableView.widthAnchor, multiplier: 0.05).isActive = true
    }
  }
  
  @objc private func handlePan()
  {

    // get where the pan gesture is
    let location = jumpPanGesture.location(in: self)

    // if the pan is in the hot zone
    if location.y >= self.frame.minY + self.frame.height * 0.1 &&
       location.y <= self.frame.maxY - self.frame.height * 0.1
    {
      let index = getIndex()

      if index != -1
      {
        parentTableView?.scrollToRow(at: indexPathArray[index],
                                     at: .top,
                                     animated: false)
      }
    }
  }

  private func getIndex() -> Int
  {
    var index = -1

    if indexPathArray.count != 0
    {
      let ratio = (jumpPanGesture.location(in: self).y - self.frame.height * 0.1) / (self.frame.height * 0.8)
      index = Int(ratio * CGFloat(indexPathArray.count))
    }
    
    return index
  }
  
  // JSRotationDelegate
  public func jsRotatingView(_ view: JSRotatingView, hasRotatedTo orientation: UIDeviceOrientation)
  {
    self.setNeedsDisplay()
  }
  
}
