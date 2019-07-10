//
//  SuffixArraySequence.swift
//  OtusHomework
//
//  Created by Developer on 01/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

struct SuffixArrayIterator: IteratorProtocol {
    
    let string: String
    let last: String.Index
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        self.last = string.endIndex
        self.offset = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < last else {
            return nil
        }
        let sub: Substring = string[offset..<last]
        string.formIndex(after: &offset)
        return sub
    }
}

struct SuffixArraySequence: Sequence {
    let string: String
    func makeIterator() -> SuffixArrayIterator {
        return SuffixArrayIterator(string: string)
    }
}

