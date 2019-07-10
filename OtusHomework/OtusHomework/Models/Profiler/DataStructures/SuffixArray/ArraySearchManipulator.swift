//
//  NaiveArrayManipulator.swift
//  OtusHomework
//
//  Created by Developer on 02/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

class ArraySearchManipulator {
    
    private var allSearchStrings = [String]()
    
    func loadArray(results: [SearchResult]) {
        self.allSearchStrings = Services.algoProvider.all
    }
    
    func search(searchString: String, maxOccurencies: Int = 1) -> [String] {
        var results = [String]()
        let maxCount = maxOccurencies == 0 ? Int.max : maxOccurencies
        var i = 0
        while i < allSearchStrings.count && results.count < maxCount {
            let string = allSearchStrings[i]
            if string.contains(searchString) {
                results.append(string)
            }
            i += 1
        }
        return results
    }
    
}

// MARK : - Measure time

extension ArraySearchManipulator: SearchManipulator {
    
    func loadArrayWithMeasuring(results: [SearchResult]) -> TimeInterval {
        let time = Profiler.runClosureForTime() {
            self.loadArray(results: results)
        }
        return time
    }
    
    func searchWithMeasuring(searchString: String, maxOccurencies: Int = 1) -> (TimeInterval, [String]) {
        var results = [String]()
        let time = Profiler.runClosureForTime {
            results = self.search(searchString: searchString, maxOccurencies: maxOccurencies)
        }
        return (time, results)
    }
    
}
