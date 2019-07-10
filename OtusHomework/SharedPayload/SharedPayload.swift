//
//  SharedPayload.swift
//  SharedPayload
//
//  Created by Developer on 09/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation


public protocol SharedPayloadReadable {
    func readPayload() -> String?
}

public protocol SharedPayloadWriteable {
    func writePayload(_ payload: String)
}

public final class SharedPayloadProvider: SharedPayloadReadable, SharedPayloadWriteable {
    
    private let applicationGroupID = "group.igor.lepeshkin.otus.homework"
    private let payloadKey = "sharedText"
    
    public init() {}
    
    public func writePayload(_ payload: String) {
        let userDefaults = UserDefaults(suiteName: applicationGroupID)
        userDefaults?.set(payload, forKey: payloadKey)
        userDefaults?.synchronize()
    }
    
    public func readPayload() -> String? {
        let userDefaults = UserDefaults(suiteName: applicationGroupID)
        return userDefaults?.string(forKey: payloadKey)
    }
    
}
