//
//  BenchmarkViewController.swift
//  TaskAboutLifecycle
//
//  Created by developer on 6/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class BenchmarkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBehaviors(behaviors: [TimerBehavior()])
    }

}
