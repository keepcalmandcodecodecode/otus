//
//  PieChartView.swift
//  OtusHomework
//
//  Created by developer on 6/23/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class PieChartView: UIView {
    
    private var shapeLayers: [CAShapeLayer] = []

    var textFont = UIFont.systemFont(ofSize: 8.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var items:[PieChartItem] = [] {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var radius: CGFloat = 10.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsDisplay()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for shapeLayer in self.shapeLayers {
            shapeLayer.removeFromSuperlayer()
            shapeLayer.frame = self.bounds
            self.layer.addSublayer(shapeLayer)
            shapeLayer.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        for shapeLayer in self.shapeLayers {
            shapeLayer.removeFromSuperlayer()
        }
        self.shapeLayers = []
        var maxRadius = min(self.bounds.width, self.bounds.height) / 2.0
        if maxRadius > radius {
            maxRadius = radius
        }
        var sum = self.items.reduce(into: 0, { $0 += $1.value })
        var noData = false
        if sum == 0 {
            noData = true
            sum = self.items.count
        }
        var startAngle = -CGFloat.pi / 2.0
        let center = CGPoint(x: self.bounds.width/2.0, y: self.bounds.height/2.0)

        for item in self.items {
            let shapeLayer = CAShapeLayer()
            shapeLayer.bounds = self.bounds
            shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
            let bezierPath = UIBezierPath()

            let partValue = noData ? (1.0 / CGFloat(sum)) : (CGFloat(item.value) * 1.0 / CGFloat(sum))
            let endAngle = startAngle + partValue * CGFloat.pi * 2
            bezierPath.move(to: center)
            bezierPath.addLine(to: CGPoint.pointOnArc(center: center, alpha: startAngle, radius: maxRadius))
            bezierPath.addArc(withCenter: center, radius: maxRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            bezierPath.addLine(to: center)
            bezierPath.close()
            item.color.setFill()
            bezierPath.fill()
            shapeLayer.fillColor = item.color.cgColor
            shapeLayer.path = bezierPath.cgPath
            self.layer.addSublayer(shapeLayer)
            self.shapeLayers.append(shapeLayer)
            
            if partValue > 0.1 {
                let halfAngle = startAngle + (endAngle - startAngle) / 2.0
                let segmentCenter = CGPoint.pointOnArc(center: center, alpha: halfAngle, radius: maxRadius / 2.0)
                let attributes = [NSAttributedString.Key.font: self.textFont,
                                  NSAttributedString.Key.foregroundColor: item.color.contrastColor()]
                let textSize = (item.text as NSString).size(withAttributes: attributes)
                let renderRect = CGRect(x: segmentCenter.x - textSize.width / 2.0, y: segmentCenter.y - textSize.height / 2.0, width: textSize.width, height: textSize.height)
                (item.text as NSString).draw(in: renderRect, withAttributes: attributes)
            }
            
            startAngle = endAngle
        }
    }

}
