//
//  PieChartSliceLayer.swift
//  OtusHomework
//
//  Created by Developer on 24/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation
import UIKit

class PieChartSliceLayer: CAShapeLayer {
    
    @objc @NSManaged var endAngle: CGFloat
    var startAngle: CGFloat = 0
    var text = ""
    var font: UIFont = UIFont.systemFont(ofSize: 16.0)
    var color: UIColor = .white
    
    override init() {
        super.init()
        self.isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isOpaque = false
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        self.isOpaque = false
    }
    
    override class func needsDisplay(forKey key: String) -> Bool {
        if key == #keyPath(PieChartSliceLayer.endAngle) {
            return true
        }
        return super.needsDisplay(forKey: key)
    }

    override func action(forKey event: String) -> CAAction? {
        if event == #keyPath(PieChartSliceLayer.endAngle) {
            let animation = CABasicAnimation(keyPath: event)
            animation.fromValue = self.startAngle
            animation.toValue = self.endAngle
            return animation;
        }
        return super.action(forKey: event)
    }
    
    override func display() {
        let endAngle = self.presentation()?.endAngle ?? self.endAngle
        UIGraphicsBeginImageContext(self.bounds.size)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        ctx.move(to: center)
        ctx.addArc(center: center, radius: self.bounds.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        ctx.addLine(to: CGPoint(x: self.bounds.midX, y: self.bounds.midY))
        ctx.setFillColor(self.color.cgColor)
        ctx.closePath()
        ctx.drawPath(using: .fill)
        let halfAngle = self.startAngle + (self.endAngle - self.startAngle) / 2.0
        var segmentCenter = CGPoint.pointOnArc(center: center, alpha: halfAngle, radius: self.bounds.width / 2.0)
        segmentCenter.x = segmentCenter.x - 2.0
        let attributes = [NSAttributedString.Key.font: self.font,
                          NSAttributedString.Key.foregroundColor: self.color.contrastColor()]
        (self.text as NSString).draw(at: segmentCenter, withAttributes: attributes)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage {
            self.contents = image
        }
        
    }
    
}
