//
//  ProfileViewController.swift
//  TaskAboutLifecycle
//
//  Created by developer on 6/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, StatusBarConfigurable {
    var statusBarStyle: UIStatusBarStyle?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBehaviors(behaviors: [StatusBarBehavior()])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle ?? .default
    }
}
