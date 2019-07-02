//
//  SearchManipulator.swift
//  OtusHomework
//
//  Created by Developer on 02/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

protocol SearchManipulator {
    
    func loadArrayWithMeasuring(results: [SearchResult]) -> TimeInterval
    func searchWithMeasuring(searchString: String, maxOccurencies: Int) -> (TimeInterval, [String])
    
}
