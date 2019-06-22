//
//  Array.swift
//  TaskAboutLifecycle
//
//  Created by Exey Panteleev on 11/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
}
