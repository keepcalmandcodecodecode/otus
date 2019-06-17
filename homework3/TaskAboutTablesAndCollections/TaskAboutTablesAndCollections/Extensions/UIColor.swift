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
    
}
