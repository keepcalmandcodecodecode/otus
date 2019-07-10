//
//  Search.swift
//  OtusHomework
//
//  Created by Developer on 02/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

struct Search {
    
    static func binarySearch<T>(item: T, in collection: [T], compare: (T, T) -> ComparisonResult) -> Int? {
        if collection.count == 0 {
            return nil
        }
        if collection.count == 1 {
            return compare(collection[0], item) == .orderedSame ? 0 : nil
        }
        var left = 0
        var right = collection.count - 1
        while left <= right {
            let mid = Int(floor(Double((left + right)) / 2.0))
            let comparisionResult = compare(collection[mid], item)
            if comparisionResult == .orderedAscending {
                left = mid + 1
            } else if comparisionResult == .orderedDescending {
                right = mid - 1
            } else {
                return mid
            }
        }
        return nil
    }
    
}
