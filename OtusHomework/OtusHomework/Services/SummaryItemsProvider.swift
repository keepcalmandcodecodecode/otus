//
//  SummaryItemsProvider.swift
//  TaskAboutTablesAndCollections
//
//  Created by developer on 6/16/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

struct SummaryItemsProvider {
    
    func items() -> [String] {
        var array = [String]()
        for i in 0..<30 {
            array.append("item \(i)")
        }
        return array
    }
}
