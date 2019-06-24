//
//  PieChartItem.swift
//  OtusHomework
//
//  Created by developer on 6/23/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation
import UIKit

struct PieChartItem {
    let color: UIColor
    let text: String
    private let foregroundColor: UIColor
    let value: Int
    
    init(color: UIColor, text: String = "", value: Int = 0) {
        self.color = color
        self.text = text
        self.value = value
        self.foregroundColor = color.contrastColor()
    }
}
