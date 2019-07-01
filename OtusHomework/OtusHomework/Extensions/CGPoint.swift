//
//  CGPoint.swift
//  OtusHomework
//
//  Created by developer on 6/23/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGPoint {
    static func pointOnArc(center: CGPoint, alpha: CGFloat, radius: CGFloat) -> CGPoint {
        return CGPoint(x: radius * cos(alpha) + center.x, y: radius * sin(alpha) + center.y)
    }
}
