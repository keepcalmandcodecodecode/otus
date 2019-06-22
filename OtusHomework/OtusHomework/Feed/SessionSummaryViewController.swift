//
//  SessionSummaryViewController.swift
//  TaskAboutTablesAndCollections
//
//  Created by developer on 6/16/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class SessionSummaryViewController: UIViewController {

    private var item: String?
    @IBOutlet var itemTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.itemTitleLabel.text = self.item ?? ""
    }
    
    func setItem(item: String) {
        self.item = item
    }
}

extension SessionSummaryViewController {
    
    static func buildFromStoryboard(item: String) -> SessionSummaryViewController? {
        let storyboard = UIStoryboard(name: "Feed", bundle: Bundle.main)
        guard let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? SessionSummaryViewController else {
            return nil
        }
        controller.setItem(item: item)
        return controller
    }
    
}
