//
//  SuffixArraySequence.swift
//  OtusHomework
//
//  Created by Developer on 01/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

struct SuffixArraySequence: Sequence {
    let string: String
    func makeIterator() -> SuffixArrayIterator {
        return SuffixArrayIterator(string: string)
    }
}
