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
    @IBOutlet var segmentedControl: UISegmentedControl!

    var stringToConvert: String? = nil {
        didSet {
            updateTextView()
        }
    }
    
    //MARK: ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateTextView()
    }
    
    //MARK: Actions
    
    @IBAction func closeScreen(sender: Any?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tabChanged(_ sender: Any) {
        self.updateTextView()
    }

    //MARK: Private
    
    private func updateTextView() {
        if self.segmentedControl == nil || self.textView == nil {
            return
        }
        let converter
            = self.converter(index: self.segmentedControl.selectedSegmentIndex)
        self.textView.text = converter.convert()
    }
    
    private func converter(index: Int) -> Converter {
        switch index {
        case 0:
            return LocalUnitConverter(text: self.stringToConvert ?? "", locale: Locale(identifier: "en-US"))
        case 1:
            return LocalUnitConverter(text: self.stringToConvert ?? "", locale: Locale(identifier: "fr-FR"))
        case 2:
            return LocalUnitConverter(text: self.stringToConvert ?? "", locale: Locale(identifier: "zh_Hant_TW"))
        default:
            return NoneConverter(text: self.stringToConvert ?? "", locale: Locale(identifier: "ru-RU"))
        }
    }
}
