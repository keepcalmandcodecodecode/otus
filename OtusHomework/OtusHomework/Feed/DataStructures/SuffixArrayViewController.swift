//
//  SuffixArrayViewController.swift
//  OtusHomework
//
//  Created by developer on 7/1/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

private enum rows: Int {
    case creation = 0
    case search3symbols1
    case search3symbols2
    case search3symbols3
}

class SuffixArrayViewController: DataStructuresViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create SuffixArray and Test", for: UIControl.State())
    }
}
