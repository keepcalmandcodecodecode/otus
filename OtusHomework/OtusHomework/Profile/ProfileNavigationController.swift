//
//  ProfileNavigationController.swift
//  TaskAboutLifecycle
//
//  Created by developer on 6/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class ProfileNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return  self.viewControllers.last?.preferredStatusBarStyle ?? .default
    }
}
