//
//  UIColor.swift
//  TaskAboutLifecycle
//
//  Created by Exey Panteleev on 11/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var randomNoWhite: UIColor {
        return UIColor( red: .random(in: 0...0.95),
                        green: .random(in: 0...0.95),
                        blue: .random(in: 0...0.95),
                        alpha: 1)
    }
    
    func contrastColor() -> UIColor {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        if a < 0.5 {
            return .black
        }
        var newR = 1.0 - r*a
        var newG = 1.0 - g*a
        var newB = 1.0 - b*a
        if abs(newR - r*a) < 0.5
            && abs(newB - b*a) < 0.5
            && abs(newG - g*a) < 0.5 {
            newR = newR+0.45
            newG = newG+0.45
            newB = newB+0.45
        }
        return UIColor(red: newR, green: newG, blue: newB, alpha: 1.0)
    }
    
}
