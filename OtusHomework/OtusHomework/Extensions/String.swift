//
//  String.swift
//  OtusHomework
//
//  Created by developer on 7/11/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

extension String {
    
    func removeCharacters(notIn goodChars: CharacterSet) -> String {
        let passed = self.unicodeScalars.filter { goodChars.contains($0) }
        return String(String.UnicodeScalarView(passed))
    }
    
    func removeCharacters(notIn: String) -> String {
        return removeCharacters(notIn: CharacterSet(charactersIn: notIn))
    }
}
