//
//  SplitViewController.swift
//  TaskAboutStoryboards
//
//  Created by developer on 6/3/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return viewControllers.last?.preferredStatusBarStyle ?? .default
    }
}
