//
//  RingGraphView.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/25/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class RingGraphView: UIView {
    struct Constants {
        static let diameter: CGFloat = 2.0 * CGFloat.pi
    }
    
    @IBInspectable var arcColor: UIColor = UIColor.white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var arcBackgroundColor: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var arcWidth: CGFloat = 5.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var value: CGFloat = 0.0 {
        didSet {
            reloadStartAndEndPoints()
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var beginPoint: CGFloat = 0.0 {
        didSet {
            reloadStartAndEndPoints()
        }
    }
    
    private var startPoint: CGFloat = 0
    private var endPoint: CGFloat = 0
    
    //    MARK: - View Lifecyle
    override func draw(_ rect: CGRect) {
        drawCircleGraph(rect: rect)
    }
    
    //    MARK: - Graph Draw
    private func drawCircleGraph(rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let radius = getRadius(rect: rect)
        
        //Line attributes
        context.setLineWidth(arcWidth)
        context.setLineCap(CGLineCap.round)
        
        //Background
        context.setStrokeColor(arcBackgroundColor.cgColor)
        context.addArc(center: center, radius: radius, startAngle: 0, endAngle: Constants.diameter, clockwise: false)
        context.strokePath()
        
        //Arc
        context.setStrokeColor(arcColor.cgColor)
        context.setLineWidth(arcWidth)
        context.addArc(center: center, radius: radius, startAngle: startPoint, endAngle: endPoint, clockwise: false)
        context.strokePath()
    }
    
    private func reloadStartAndEndPoints() {
        startPoint = -beginPoint * Constants.diameter
        endPoint = value * Constants.diameter + startPoint
    }
    
    private func getRadius(rect: CGRect) -> CGFloat {
        if rect.width > rect.height {
            return (rect.width - arcWidth) / 2.0
        } else{
            return (rect.height - arcWidth) / 2.0
        }
    }
}
