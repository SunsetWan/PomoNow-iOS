//
//  CProgressView.swift
//  CProgressView
//
//  Created by Sebastian Trześniewski on 21.04.2015.
//  Copyright (c) 2015 Sebastian Trześniewski. All rights reserved.
//

import UIKit

@IBDesignable class CProgressView: UIView {
    
    // Variables
    private var π: CGFloat = CGFloat(M_PI)
    private var progressCircle = CAShapeLayer()
    private var realProgressCircle = CAShapeLayer()
    private var circlePath = UIBezierPath()
    internal var statusProgress: Int = Int()

    // Method for calculate ARC
    private func arc(arc: CGFloat) -> CGFloat {
        let results = ( π * arc ) / 180
        return results
    }
    
    // Variables for IBInspectable
    @IBInspectable var circleColor: UIColor = UIColor.grayColor()
    @IBInspectable var progressColor: UIColor = UIColor.greenColor()
    @IBInspectable var lineWidth: Float = Float(3.0)
    @IBInspectable var valueProgress: Float = Float()
    
    override func drawRect(rect: CGRect) {

        // Create Path for ARC
        let centerPointArc = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        let radiusArc: CGFloat = self.frame.width / 2 * 0.8
        circlePath = UIBezierPath(arcCenter: centerPointArc, radius: radiusArc, startAngle: arc(-90), endAngle: arc(450), clockwise: true)

        // Define background circle progress
        progressCircle.path = circlePath.CGPath
        progressCircle.strokeColor = circleColor.CGColor
        progressCircle.fillColor = UIColor.clearColor().CGColor
        progressCircle.lineWidth = CGFloat(lineWidth)
        progressCircle.strokeStart = 0
        progressCircle.strokeEnd = 100

        // Define real circle progress
        realProgressCircle.path = circlePath.CGPath
        realProgressCircle.strokeColor = progressColor.CGColor
        realProgressCircle.fillColor = UIColor.clearColor().CGColor
        realProgressCircle.lineWidth = CGFloat(lineWidth) + 0.1
        realProgressCircle.strokeStart = 0
        realProgressCircle.strokeEnd = CGFloat(valueProgress) / 100
        if realProgressCircle.strokeEnd > 0.6666 {
            realProgressCircle.strokeEnd = 0.6666
        }
        
        // Set for sublayer circle progress
        layer.addSublayer(progressCircle)
        layer.addSublayer(realProgressCircle)
    }

}