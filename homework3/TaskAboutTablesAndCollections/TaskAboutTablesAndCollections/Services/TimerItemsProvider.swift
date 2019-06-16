//
//  TimersProvider.swift
//  TaskAboutTablesAndCollections
//
//  Created by developer on 6/16/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation


struct TimerItemsProvider {
    
    func items() -> [TimerItem] {
        var array = [TimerItem]()
        for _ in 0..<30 {
            array.append(TimerItem())
        }
        return array
    }
    
}
