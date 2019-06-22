
//
//  File.swift
//  TaskAboutLifecycle
//
//  Created by developer on 6/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation
import UIKit

class TimerBehavior: ViewControllerLifecycleBehavior {
    private var timer: Timer?
    
    func afterAppearing(_ viewController: UIViewController) {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    @objc private func runTimed() {
        print(Date())
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        timer?.invalidate()
    }
}
