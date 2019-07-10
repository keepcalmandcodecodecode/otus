//
//  TimerItem.swift
//  TaskAboutTablesAndCollections
//
//  Created by developer on 6/16/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation

class TimerItem: NSObject {

    var stateDidUpdated: ((Bool, Int, Int) -> Void)? {
        didSet {
            stateDidUpdated?(isRunning, runningCount, pausedCount)
        }
    }
    
    var isRunning: Bool = false {
        didSet {
            stateDidUpdated?(isRunning, runningCount, pausedCount)
        }
    }
    
    var pausedCount: Int = 0 {
        didSet {
            stateDidUpdated?(isRunning, runningCount, pausedCount)
        }
    }
    
    var runningCount: Int = 0 {
        didSet {
            stateDidUpdated?(isRunning, runningCount, pausedCount)
        }
    }
    private var timer: Timer?
    
    func run() {
        if self.timer == nil {
            let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: .common)
            self.timer = timer
        }
        self.isRunning = true
        
    }
    
    @objc private func runTimed() {
        if isRunning {
            self.runningCount += 1
        } else {
            self.pausedCount += 1
        }
    }
    
    func pause() {
        self.isRunning = false
    }
    
    func reset() {
        self.timer?.invalidate()
        runningCount = 0
        pausedCount = 0
        isRunning = false
    }

}
