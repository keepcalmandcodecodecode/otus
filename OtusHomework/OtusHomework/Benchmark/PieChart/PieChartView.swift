//
//  PieChartView.swift
//  OtusHomework
//
//  Created by developer on 6/23/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class PieChartView: UIView {
    
    let drawingLayer = PieChartLayer()

    var textFont = UIFont.systemFont(ofSize:12.0) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var items:[PieChartItem] = [] {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var radius: CGFloat = 10.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let maxRadius = self.maxAvailableRadius()
        self.drawingLayer.frame = CGRect(x: self.bounds.midX - maxRadius, y: self.bounds.midY - maxRadius, width: maxRadius*2, height: maxRadius*2)
        self.drawingLayer.setNeedsDisplay()
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        self.isOpaque = false
        if self.drawingLayer.superlayer != self.layer {
            self.layer.addSublayer(self.drawingLayer)
        }
        let maxRadius = self.maxAvailableRadius()
        var sum = self.items.reduce(into: 0, { $0 += $1.value })
        var noData = false
        if sum == 0 {
            noData = true
            sum = self.items.count
        }
        var items:[PieChartLayerItem] = []
        var startAngle: CGFloat = 0
        for i in 0..<self.items.count {
            let partValue = noData ? (1.0 / CGFloat(sum)) : (CGFloat(self.items[i].value) * 1.0 / CGFloat(sum))
            let endAngle = startAngle + partValue * CGFloat.pi * 2
            items.append(PieChartLayerItem(progress: partValue, startAngle: startAngle, endAngle: endAngle, color: self.items[i].color, string: self.items[i].text))
            startAngle = endAngle
        }
        self.drawingLayer.frame = CGRect(x: self.bounds.midX - maxRadius, y: self.bounds.midY - maxRadius, width: maxRadius*2, height: maxRadius*2)
        self.drawingLayer.font = self.textFont
        self.drawingLayer.startAngle = -CGFloat.pi / 2.0
        self.drawingLayer.items = items
        self.drawingLayer.endAngle = CGFloat.pi * 2.0
        self.drawingLayer.animateChangingEndAngle()
    }
    
    private func maxAvailableRadius() -> CGFloat {
        var maxRadius = min(self.bounds.width, self.bounds.height) / 2.0
        if maxRadius > radius {
            maxRadius = radius
        }
        return maxRadius
    }

}
