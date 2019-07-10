//
//  SplitViewController.swift
//  TaskAboutStoryboards
//
//  Created by developer on 6/3/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit
import SharedPayload

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let reader: SharedPayloadReadable = SharedPayloadProvider()
        if let string = reader.readPayload() {
            let storyboard = UIStoryboard(name: "LocalUnitsConverter", bundle: Bundle.main)
            if let viewController = storyboard.instantiateInitialViewController() as? LocalUnitsConverterViewController {
                self.show(viewController, sender: self)
            }
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return viewControllers.last?.preferredStatusBarStyle ?? .default
    }
}
