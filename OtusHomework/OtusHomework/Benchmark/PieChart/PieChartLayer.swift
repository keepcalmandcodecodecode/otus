//
//  PieChartSliceLayer.swift
//  OtusHomework
//
//  Created by Developer on 24/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation
import UIKit


struct PieChartLayerItem {
    let progress: CGFloat
    let startAngle: CGFloat
    let endAngle: CGFloat
    let color: UIColor
    let string: String
}

class PieChartLayer: CAShapeLayer {
    
    static let kEndAngleAnimationKey = "animateEndAngle"
    
    var items = [PieChartLayerItem]()
    @objc @NSManaged var endAngle: CGFloat
    var startAngle: CGFloat = 0
    var text = ""
    var font: UIFont = UIFont.systemFont(ofSize: 14.0)
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
        if key == #keyPath(PieChartLayer.endAngle) {
            return true
        }
        return super.needsDisplay(forKey: key)
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

        for item in self.items {
            if item.startAngle > endAngle {
                continue
            }
            var endDrawingAngle = item.endAngle
            if item.endAngle > endAngle {
                endDrawingAngle = endAngle
            }
            ctx.move(to: center)
            ctx.addArc(center: center, radius: self.bounds.midX, startAngle: item.startAngle, endAngle: endDrawingAngle, clockwise: false)
            ctx.addLine(to: CGPoint(x: self.bounds.midX, y: self.bounds.midY))
            ctx.setFillColor(item.color.cgColor)
            ctx.closePath()
            ctx.drawPath(using: .fill)
            if item.progress > 0.1 {
                let halfAngle = item.startAngle + (endDrawingAngle - item.startAngle) / 2.0
                let segmentCenter = CGPoint.pointOnArc(center: center, alpha: halfAngle, radius: self.bounds.width / 4.0)
                let attributes = [NSAttributedString.Key.font: self.font,
                                  NSAttributedString.Key.foregroundColor: item.color.contrastColor()]
                (item.string as NSString).draw(at: segmentCenter, withAttributes: attributes)
            }
        }
        
        if let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage {
            self.contents = image
        }
        
    }
    
    func animateChangingEndAngle() {
        let animation = CABasicAnimation(keyPath: "endAngle")
        animation.duration = 0.5;
        animation.fromValue = -CGFloat.pi / 2.0;
        animation.toValue = CGFloat.pi * 2.0
        self.add(animation, forKey: PieChartLayer.kEndAngleAnimationKey)
    }
    
}
