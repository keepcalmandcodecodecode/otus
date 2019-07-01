//
//  ServiceLocator.swift
//  TaskAboutTablesAndCollections
//
//  Created by developer on 6/16/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

class Services {
    
    static let summaryItemsProvider = {
        return SummaryItemsProvider()
    }()
    
    static let timerItemsProvider = {
        return TimerItemsProvider()
    }()
    
    static let benchmarkLayoutProvider = {
        return BenchmarkLayoutProvider()
    }()
    
    static let algoProvider = {
        return AlgoProvider()
    }()
}
