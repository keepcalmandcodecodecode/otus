//
//  CustomView.swift
//  TaskAboutStoryboards
//
//  Created by developer on 5/31/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var switchControl: UISwitch!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        let myType = type(of: self)
        if let nibView: UIView = Bundle.init(for: myType).loadNibNamed(String(describing: myType), owner: self, options: nil)?.first as? UIView {
            nibView.frame = self.bounds
            nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(nibView)
        }
    }

    @IBInspectable var text: String = "" {
        didSet {
            self.textLabel.text = self.text
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 18.0 {
        didSet {
            self.textLabel.font = self.textLabel.font.withSize(self.fontSize)
        }
    }
    
    @IBInspectable var isOn: Bool = false {
        didSet {
            self.switchControl.isOn = self.isOn
        }
    }

}
