//
//  LocalUnitsConverter.swift
//  OtusHomework
//
//  Created by Developer on 10/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

protocol Converter {
    var text: String? { get }
    var fromLocale: Locale { get }
    var toLocale: Locale { get }
    func convert() -> String
}

struct NoneConverter: Converter {
    let text: String?
    let fromLocale: Locale
    let toLocale: Locale
    func convert() -> String {
        return self.text ?? ""
    }
}

struct LocalUnitConverter: Converter {
    let text: String?
    let fromLocale: Locale
    let toLocale: Locale
    private let dateFormatter: DateFormatter
    private let measurementFormatter: MeasurementFormatter
    private let numberFormatter: NumberFormatter
    
    init(text: String?, fromLocale: Locale, toLocale: Locale) {
        self.text = text
        self.fromLocale = fromLocale
        self.toLocale = toLocale
        self.dateFormatter = LocalUnitConverter.dateFormatter(locale: fromLocale)
        self.measurementFormatter = LocalUnitConverter.measurementFormatter(locale: fromLocale)
        self.numberFormatter = {
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "ru-RU")
            numberFormatter.groupingSeparator = " "
            numberFormatter.numberStyle = .decimal
            return numberFormatter
        }()
    }
    
    func convert() -> String {
        guard let text = text else {
            return ""
        }
        
        let unitsFinder = UnitsFinder(text: text)
        var result = ""
        let parsedItems = unitsFinder.findDatesAndLengths()
        let localDateFormatter = LocalUnitConverter.dateFormatter(locale: self.toLocale)
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
            case .kmLength, .mmLength, .smLength, .mLength:
                let string = parsedItems[i].string
                let value = string.removeCharacters(notIn: "0123456789 ,")
                guard let doubleValue = numberFormatter.number(from: value)?.doubleValue else { continue }
                guard let type = self.measurement(by: parsedItems[i].type) else { continue }
                let measurement = Measurement(value: doubleValue, unit: type)
                let formatter = LocalUnitConverter.measurementFormatter(locale: toLocale)
                
                if i == (parsedItems.count - 1) {
                    let substring = String(text[parsedItems[i].range.upperBound..<text.endIndex])
                    result = result + formatter.string(from: measurement) + substring
                } else {
                    let substring = String(text[parsedItems[i].range.upperBound..<parsedItems[i+1].range.lowerBound])
                    result = result + formatter.string(from: measurement) + substring
                }
            
            }
        }
        if result.count == 0 {
            result = text
        }
        return result
    }

    private func measurement(by pattern: RegExPattern) -> UnitLength? {
        switch pattern {
        case .kmLength:
            return .kilometers
        case .mLength:
            return .meters
        case .mmLength:
            return .millimeters
        case .smLength:
            return .centimeters
        default:
            return nil
        }
    }
    
    private static func dateFormatter(locale: Locale) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dd MMMM yyyy", options: 0, locale: locale)
        formatter.locale = locale
        return formatter
    }
    
    private static func measurementFormatter(locale: Locale) -> MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = [.naturalScale]
        formatter.locale = locale
        return formatter
    }
}
