//
//  trendChartView.swift
//  smooth-operator
//
//  Created by Matthew Kerr on 10/07/15.
//  Copyright © 2015 Complete Hassle. All rights reserved.
//

import UIKit

class trendChartViewController: UIViewController,
  JBBarChartViewDataSource, JBBarChartViewDelegate {
  
  var valueIndex = 0
  {
    didSet {
      if(valueIndex >= fakeData.count) {valueIndex = 0}
    }
  }
  
  let fakeData = [4,8,12,6,8,0,4,1,4,7,7,2,3,7,0,8]
  
  let barChartView = JBBarChartView()

  @IBOutlet weak var historicTrendChartView: UIView!
  
  func deviceOrientationDidChange(notification: NSNotification)
  {
    barChartView.frame = historicTrendChartView.bounds
    barChartView.reloadData()
  }
  
  override func viewDidLoad() {
    
    registerForOrientationChanges()
    
    barChartView.dataSource = self
    barChartView.delegate = self
    historicTrendChartView.addSubview(barChartView)
    
  }
  
  override func viewDidLayoutSubviews() {
    barChartView.frame = historicTrendChartView.bounds
    barChartView.reloadData()
  }
  

//  
//  func numberOfLinesInbarChartView(barChartView: JBBarChartView) -> UInt
//  {
//    return 1
//  }
//  
//  func barChartView(barChartView: JBBarChartView, numberOfVerticalValuesAtLineIndex: UInt) -> UInt
//  {
//    return 4
//  }

  
  func numberOfBarsInBarChartView(barChartView: JBBarChartView) -> UInt
  {
    return 50
  }

  
  func barChartView(barChartView: JBBarChartView, heightForBarViewAtIndex: UInt) -> CGFloat
  {
    valueIndex += 1
    return CGFloat(fakeData[valueIndex])
  }

  
  
  // style the line view
  
  func barChartView(barChartView: JBBarChartView, colorForLineAtLineIndex: UInt ) -> UIColor
  {
    return .whiteColor() // color of line in chart
  }
  
  func barChartView(barChartView: JBBarChartView, colorForBarViewAtIndex: UInt) -> UIColor
  {
    return .grayColor() // color of area under line in chart
  }
  
  // style the selection view
  
  func barSelectionColorForBarChartView(barChartView: JBBarChartView) -> UIColor
  {
  return .blueColor() // color of selection view
  }
  
//  func verticalSelectionWidthForbarChartView(barChartView: JBBarChartView) -> CGFloat
//  {
//  return 50 // width of selection view
//  }
  
  func barChartView(barChartView:JBBarChartView, selectionColorForLineAtLineIndex:UInt) -> UIColor
  {
    return .blackColor() // color of selected line
  }
  
  func barChartView(barChartView: JBBarChartView, selectionFillColorForLineAtLineIndex:UInt) -> UIColor
  {
    return .whiteColor() // color of area under selected line
  }
  
  let toolTip = UIView()
  
  func barChartView(barChartView: JBBarChartView, didSelectLineAtIndex: UInt, horizontalIndex: UInt, touchPoint: CGPoint)
  {
    toolTip.backgroundColor = .whiteColor()
    toolTip.frame = CGRect(origin: touchPoint, size: CGSizeMake(50, 50))
    barChartView.addSubview(toolTip)
  }
  
  func didDeselectBarInBarChartView(barChartView: JBBarChartView)
  {
      toolTip.removeFromSuperview()
  }

  
  
  

  private func registerForOrientationChanges()
  {
    UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceOrientationDidChange:", name: UIDeviceOrientationDidChangeNotification, object: nil)
  }
  

}
