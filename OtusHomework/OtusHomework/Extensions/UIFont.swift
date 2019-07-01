//
//  UIFont.swift
//  OtusHomework
//
//  Created by Developer on 24/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    func cgFont() -> CGFont? {
        let fontName = self.fontName as NSString
        let cgFont = CGFont(fontName)
        return cgFont
    }
}
