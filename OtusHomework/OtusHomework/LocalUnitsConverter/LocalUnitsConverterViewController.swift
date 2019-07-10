//
//  LocalUnitsConverterViewController.swift
//  OtusHomework
//
//  Created by Developer on 09/07/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class LocalUnitsConverterViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!

    var stringToConvert: String? = nil {
        didSet {
            updateTextView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateTextView()
    }
    
    @IBAction func closeScreen(sender: Any?) {
        self.dismiss(animated: true, completion: nil)
    }

    private func updateTextView() {
        self.textView?.text = self.stringToConvert
    }
}
