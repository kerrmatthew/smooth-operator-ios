//
//  PriceIndicatorView.swift
//  smooth-operator
//
//  Created by Matthew Kerr on 9/07/15.
//  Copyright © 2015 Complete Hassle. All rights reserved.
//

import UIKit

@IBDesignable
class PriceIndicatorView: UIView {

  
  var needleAngle: CGFloat = -90
  
  @IBInspectable var value: Double = 0.0 {
    didSet {
      needleAngle = CGFloat(value * 180 - 90)
    }
  }
  
  
  @IBInspectable var color: UIColor = UIColor(red: 1.000, green: 0.960, blue: 0.000, alpha: 1.000)
  
    override func drawRect(rect: CGRect) {
      //// PaintCode Trial Version
      //// www.paintcodeapp.com
      
      //// General Declarations
      let context = UIGraphicsGetCurrentContext()
      
      //// Bezier 2 Drawing
      CGContextSaveGState(context)
      CGContextRotateCTM(context, -180 * CGFloat(M_PI) / 180)
      CGContextScaleCTM(context, 0.8, 0.8)

      let bezier2Path = UIBezierPath()
      bezier2Path.moveToPoint(CGPointMake(-0, -184))
      bezier2Path.addCurveToPoint(CGPointMake(-184, 0), controlPoint1: CGPointMake(-0, -82.38), controlPoint2: CGPointMake(-82.38, 0))
      bezier2Path.addCurveToPoint(CGPointMake(-368, -184), controlPoint1: CGPointMake(-285.62, 0), controlPoint2: CGPointMake(-368, -82.38))
      bezier2Path.addLineToPoint(CGPointMake(-348.5, -184))
      bezier2Path.addLineToPoint(CGPointMake(-348.5, -183.75))
      bezier2Path.addCurveToPoint(CGPointMake(-184.25, -19.5), controlPoint1: CGPointMake(-348.5, -93.04), controlPoint2: CGPointMake(-274.96, -19.5))
      bezier2Path.addCurveToPoint(CGPointMake(-20, -183.75), controlPoint1: CGPointMake(-93.54, -19.5), controlPoint2: CGPointMake(-20, -93.04))
      bezier2Path.addLineToPoint(CGPointMake(-20, -184))
      bezier2Path.addLineToPoint(CGPointMake(-0, -184))
      bezier2Path.closePath()
      color.setFill()
      bezier2Path.fill()
      
      CGContextRestoreGState(context)
      
      CGContextScaleCTM(context, 0.8, 0.8)

      //// Bezier 3 Drawing
      CGContextSaveGState(context)
      CGContextTranslateCTM(context, 184.11, 176.94)
      CGContextRotateCTM(context, needleAngle * CGFloat(M_PI) / 180)
      
      let bezier3Path = UIBezierPath()
      bezier3Path.moveToPoint(CGPointMake(-0.11, -143.93))
      bezier3Path.addCurveToPoint(CGPointMake(12.66, -8.39), controlPoint1: CGPointMake(-0.11, -143.94), controlPoint2: CGPointMake(10.91, -26.9))
      bezier3Path.addCurveToPoint(CGPointMake(12.89, -5.94), controlPoint1: CGPointMake(12.81, -7.59), controlPoint2: CGPointMake(12.89, -6.77))
      bezier3Path.addCurveToPoint(CGPointMake(-0.11, 7.06), controlPoint1: CGPointMake(12.89, 1.24), controlPoint2: CGPointMake(7.07, 7.06))
      bezier3Path.addCurveToPoint(CGPointMake(-13.11, -5.94), controlPoint1: CGPointMake(-7.29, 7.06), controlPoint2: CGPointMake(-13.11, 1.24))
      bezier3Path.addCurveToPoint(CGPointMake(-12.88, -8.39), controlPoint1: CGPointMake(-13.11, -6.77), controlPoint2: CGPointMake(-13.03, -7.59))
      bezier3Path.addCurveToPoint(CGPointMake(-0.11, -143.94), controlPoint1: CGPointMake(-11.14, -26.9), controlPoint2: CGPointMake(-0.11, -143.94))
      bezier3Path.addLineToPoint(CGPointMake(-0.11, -143.93))
      bezier3Path.closePath()
      UIColor.blackColor().setFill()
      bezier3Path.fill()
      
      
      CGContextRestoreGState(context)
      
      super.drawRect(rect)
    }

}
