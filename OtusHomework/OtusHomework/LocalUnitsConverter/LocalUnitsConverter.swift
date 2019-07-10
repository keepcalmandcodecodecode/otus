//
//  LocalUnitsConverter.swift
//  OtusHomework
//
//  Created by Developer on 10/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

protocol Converter {
    var text: String? {get set}
    var locale: Locale {get set}
    func convert() -> String
}

struct NoneConverter: Converter {
    var text: String?
    var locale: Locale
    func convert() -> String {
        return self.text ?? ""
    }
}

struct LocalUnitConverter: Converter {
    var text: String?
    var locale: Locale
    private let dateFormatter: DateFormatter = LocalUnitConverter.dateFormatter(locale: Locale(identifier: "ru-RU"))
    
    func convert() -> String {
        guard let text = text else {
            return ""
        }
        
        let unitsFinder = UnitsFinder(text: text)
        var result = ""
        let parsedItems = unitsFinder.findDatesAndLengths()
        let localDateFormatter = LocalUnitConverter.dateFormatter(locale: self.locale)
        if parsedItems.count > 0 {
            result = String(text[text.startIndex..<parsedItems[0].range.lowerBound])
        }
        for i in 0..<parsedItems.count {
            switch parsedItems[i].type {
            case .date:
                guard let date = self.dateFormatter.date(from: parsedItems[i].string) else { continue }
                if i == (parsedItems.count - 1) {
                    let substring = String(text[parsedItems[i].range.upperBound..<text.endIndex])
                    result = result + localDateFormatter.string(from: date) + substring
                } else {
                    let substring = String(text[parsedItems[i].range.upperBound..<parsedItems[i+1].range.lowerBound])
                    result = result + localDateFormatter.string(from: date) + substring
                }
            default:
                break;
            }
        }
        if result.count == 0 {
            result = text
        }
        return result
    }
    
    private static func dateFormatter(locale: Locale) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        formatter.dateFormat = "dd MMMM yyyy"
        formatter.locale = locale
        return formatter
    }
}
