//
//  LocalUnitsConverter.swift
//  OtusHomework
//
//  Created by Developer on 10/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

struct LocalUnitConverter {
    var text: String?
    var locale: Locale
    
    func convert() -> String {
        guard let text = text else {
            return
        }
        let regexp = try NSRegularExpression
    }
}
