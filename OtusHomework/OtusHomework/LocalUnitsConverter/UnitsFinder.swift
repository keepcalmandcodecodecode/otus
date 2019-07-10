//
//  UnitsFinder.swift
//  OtusHomework
//
//  Created by Developer on 10/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

enum RegExPattern: String {
    case date = #"[0-9]+\ ((я|Я)нваря|(ф|Ф)евраля|(м|М)арта|(а|А)апреля|(м|М)ая|(и|И)юля|(и|И)юня|(а|А)вгуста|(с|С)ентября|(о|О)ктября|(н|Н)оября|(д|Д)екабря) [0-9]+"#
    case mLength = #"[0-9][0-9\ ,0-9]+( м)[^а-я]"#
    case mmLength = #"[0-9][0-9\ ,0-9]+( см)[^а-я]"#
    case kmLength = #"[0-9][0-9\ ,0-9]+( км)[^а-я]"#
    case smLength = #"[0-9][0-9\ ,0-9]+( мм)[^а-я]"#
}

struct ParsedItem {
    let type: RegExPattern
    let string: String
    let range: Range<String.Index>
}

struct UnitsFinder {
    var text: String?
    
    func findDatesAndLengths() -> [ParsedItem] {
        var result = [ParsedItem]()
        guard let text = text else { return result }
        let patterns = [RegExPattern.date]
        let regexs = patterns
            .map({ pattern in
                return try? NSRegularExpression(pattern: pattern.rawValue, options: [])
            })
            .compactMap({$0})
        let range = NSRange(location: 0, length: text.count)
        for regex in regexs {
            guard let pattern = RegExPattern(rawValue: regex.pattern) else { continue }
            let matches = regex.matches(in: text, options: [], range: range)
            for match in matches {
                if match.range.location == NSNotFound {
                    continue
                }
                guard let range = Range(match.range, in: text) else { continue }
                let substring = String(text[range.lowerBound..<range.upperBound])
                let parsedItem = ParsedItem(type: pattern, string: substring, range: range)
                result.append(parsedItem)
            }
        }
        result.sort { (item0, item1) -> Bool in
            item0.range.lowerBound <= item1.range.lowerBound
        }
        return result
    }
}
