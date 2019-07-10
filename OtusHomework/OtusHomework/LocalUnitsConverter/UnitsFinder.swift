//
//  UnitsFinder.swift
//  OtusHomework
//
//  Created by Developer on 10/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

enum ReplacementStringType {
    case date, mLength, mmLength, kmLength, 
}

struct ReplacementString {
    let type: ReplacementStringType = .date
    let string = ""
    let range = NSRange(location: NSNotFound, length: 0)
}

struct UnitsFinder {
    var text: String?
    
    func findDatesAndLengths() -> [ReplacementString] {
        var result = [ReplacementString]()
        let datePattern = #"[0-9]{1}\ ((я|Я)нваря|(ф|Ф)евраля|(м|М)арта|(а|А)апреля|(м|М)ая|(и|И)юля|(и|И)юня|(а|А)вгуста|(с|С)ентября|(о|О)ктября|(н|Н)оября)|(д|Д)екабря\ [0-9]{4}"#
        let mPattern = #"[0-9][0-9\ ,0-9]+( м)[^а-я]"#
        let smPattern = #"[0-9][0-9\ ,0-9]+( см)[^а-я]"#
        let kmPattern = #"[0-9][0-9\ ,0-9]+( км)[^а-я]"#
        let mmPattern = #"[0-9][0-9\ ,0-9]+( мм)[^а-я]"#
        //метры [0-9][0-9\ ,0-9]+( м)[^а-я]
        //сантиметры [0-9][0-9\ ,0-9]+( см)[^а-я]
        //километры [0-9][0-9\ ,0-9]+( км)[^а-я]
        //миллиметры [0-9][0-9\ ,0-9]+( мм)[^а-я]
        //find all ocurrences of regex date
        //find all ocure
        //sort by location
        return result
    }
}
