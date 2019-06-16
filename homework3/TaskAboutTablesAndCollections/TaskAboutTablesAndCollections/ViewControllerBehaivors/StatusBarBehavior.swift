//
//  StatusBarBehaivor.swift
//  TaskAboutLifecycle
//
//  Created by developer on 6/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import Foundation
import UIKit

protocol StatusBarConfigurable: UIViewController {
    var statusBarStyle: UIStatusBarStyle? { get set }
}

class StatusBarBehavior: ViewControllerLifecycleBehavior {
    private var previousBarStyle: UIBarStyle?
    private var previousStatusBarStyle: UIStatusBarStyle?
    
    func beforeAppearing(_ viewController: UIViewController) {
        viewController.view.backgroundColor = .black
        previousBarStyle = viewController.navigationController?.navigationBar.barStyle
        viewController.navigationController?.navigationBar.barStyle = .black
        if let vc = viewController as? StatusBarConfigurable {
            previousStatusBarStyle = viewController.preferredStatusBarStyle
            vc.statusBarStyle = .lightContent
            vc.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    func afterDisappearing(_ viewController: UIViewController) {
        viewController.navigationController?.navigationBar.barStyle = previousBarStyle ?? .default
        if let vc = viewController as? StatusBarConfigurable {
            vc.statusBarStyle = previousStatusBarStyle ?? .default
            vc.setNeedsStatusBarAppearanceUpdate()
        }
    }
}
