//
//  TimerCollectionViewCell.swift
//  TaskAboutTablesAndCollections
//
//  Created by developer on 6/16/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class TimerCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: TimerCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: TimerCollectionViewCell.self), bundle: nil)

    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var secondsLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var view: UIView!
    
    weak var timer:TimerItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        self.activityIndicatorView.stopAnimating()
        self.secondsLabel.text = ""
        self.progressView.progress = 0.0
        self.timer = nil
    }
    
    func updateWithTimer(timer: TimerItem, color: UIColor) {
        if timer == self.timer {
            self.configureWithState(timer: timer, color: color)
        }
    }

    func configureWithState(timer: TimerItem, color: UIColor) {
        if timer.isRunning {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
        self.secondsLabel.text = "\(timer.count)"
        self.progressView.setProgress(Float((timer.count%60))/60.0, animated: true)
        self.view.backgroundColor = color
        self.timer = timer
    }
}
