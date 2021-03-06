//
//  SuffixArrayManipulator.swift
//  OtusHomework
//
//  Created by Developer on 02/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

class SuffixArrayManipulator {

    private var allSearchStrings = [SearchResult]()
    
    func loadArray(results: [SearchResult]) {
        self.allSearchStrings = results
    }
    
    func search(searchString: String, maxOccurencies: Int = 1) -> [String] {
        var results = [String]()
        guard let firstIndex = Search.binarySearch(item: (suffix: searchString, name: ""), in: allSearchStrings, compare: {sr1,sr2 in
            return sr1.suffix.compare(sr2.suffix)
        }) else {
            return results
        }
        results.append(allSearchStrings[firstIndex].name)
        if maxOccurencies == 1 {
            return results
        }
        
        //find from top
        var i = firstIndex - 1
        let maxCount = maxOccurencies == 0 ? Int.max : maxOccurencies
        var stop = false
        while i >= 0 && results.count < maxCount && !stop {
            if allSearchStrings[i].suffix == searchString {
                results.append(allSearchStrings[i].name)
            } else {
                stop = true
            }
            i -= 1
        }
        
        //find from bottom
        stop = false
        if firstIndex < allSearchStrings.count - 1 {
            i = firstIndex + 1
            while i < self.allSearchStrings.count && results.count <= maxCount && !stop {
                if allSearchStrings[i].suffix == searchString {
                    results.append(allSearchStrings[i].name)
                } else {
                    stop = true
                }
                i += 1
            }
        }
        return results
    }
    
    
}

// MARK : - Measure time

extension SuffixArrayManipulator: SearchManipulator {
    
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
        print("---")
        for result in results {
            print(result)
        }
        print("---")
        return (time, results)
    }
    
}

