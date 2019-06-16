//
//  TimerItem.swift
//  TaskAboutTablesAndCollections
//
//  Created by developer on 6/16/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

class TimerItem: NSObject {
    
    var stateDidUpdated: ((Bool, Int) -> Void)?
    
    var isRunning: Bool = false {
        didSet {
            stateDidUpdated?(isRunning, count)
        }
    }
    var count: Int = 0 {
        didSet {
            stateDidUpdated?(isRunning, count)
        }
    }
    private var timer: Timer?
    
    func run() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    @objc private func runTimed() {
        self.count += 1
        self.isRunning = true
    }
    
    func pause() {
        self.timer?.invalidate()
        self.isRunning = false
    }
    
    func reset() {
        self.timer?.invalidate()
        count = 0
        isRunning = false
    }
}
