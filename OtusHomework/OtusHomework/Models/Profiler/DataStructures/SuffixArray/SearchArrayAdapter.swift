//
//  SearchArrayAdapter.swift
//  OtusHomework
//
//  Created by developer on 7/2/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

typealias SearchResult = (suffix: String, name: String)

struct SearchArrayAdapter {
    static func adapt(input: [String]) -> [SearchResult] {
        var result = [SearchResult]()
        for value in input {
            let sequence = SuffixArraySequence(string: value)
            var iterator = sequence.makeIterator()
            while let suffix = iterator.next() {
                result.append((suffix: String(suffix), value))
            }
        }
        return result.sorted(by: { $0.suffix < $1.suffix })
    }
}
