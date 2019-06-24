//
//  PieChartView.swift
//  OtusHomework
//
//  Created by developer on 6/23/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class PieChartView: UIView {
    
    var sliceSublayers = [PieChartSliceLayer]()
    
    var textFont = UIFont.systemFont(ofSize: 12.0) {
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
        for layer in self.sliceSublayers {
            layer.frame = CGRect(x: self.bounds.midX - maxRadius, y: self.bounds.midY - maxRadius, width: maxRadius*2, height: maxRadius*2)
            layer.setNeedsLayout()
            layer.setNeedsDisplay()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        self.isOpaque = false
        
        if self.sliceSublayers.count < self.items.count {
            let diff = self.items.count - self.sliceSublayers.count
            for _ in 0..<diff {
                let layer = PieChartSliceLayer()
                self.sliceSublayers.append(layer)
                self.layer.addSublayer(layer)
            }
        } else if self.sliceSublayers.count > self.items.count {
            let diff = self.sliceSublayers.count - self.items.count
            for i in 0..<diff {
                self.sliceSublayers[i].removeFromSuperlayer()
            }
            self.sliceSublayers.removeFirst(diff)
        }
        
        
        let maxRadius = self.maxAvailableRadius()
        var sum = self.items.reduce(into: 0, { $0 += $1.value })
        var noData = false
        if sum == 0 {
            noData = true
            sum = self.items.count
        }
        var startAngle: CGFloat = 0
        
        for i in 0..<self.items.count {
            let partValue = noData ? (1.0 / CGFloat(sum)) : (CGFloat(self.items[i].value) * 1.0 / CGFloat(sum))
            let endAngle = startAngle + partValue * CGFloat.pi * 2
            self.sliceSublayers[i].startAngle = startAngle
            self.sliceSublayers[i].endAngle = endAngle
            self.sliceSublayers[i].frame = CGRect(x: 0, y: 0, width: maxRadius*2, height: maxRadius*2)
            self.sliceSublayers[i].zPosition = 0
            self.sliceSublayers[i].position = self.layer.position
            self.sliceSublayers[i].font = self.textFont
            self.sliceSublayers[i].color = self.items[i].color
            self.sliceSublayers[i].text = self.items[i].text
            self.sliceSublayers[i].needsDisplay()
            startAngle = endAngle
        }
    }
    
    private func maxAvailableRadius() -> CGFloat {
        var maxRadius = min(self.bounds.width, self.bounds.height) / 2.0
        if maxRadius > radius {
            maxRadius = radius
        }
        return maxRadius
    }

}
