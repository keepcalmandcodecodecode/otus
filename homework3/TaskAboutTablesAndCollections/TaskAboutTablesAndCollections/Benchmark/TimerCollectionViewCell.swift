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
    
    var willReuse: (() -> Void)?

    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var secondsLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        self.willReuse?()
        self.activityIndicatorView.stopAnimating()
        self.secondsLabel.text = ""
        self.progressView.progress = 0.0
    }

    func configureWithState(isRunning: Bool, count: Int, color: UIColor) {
        if isRunning {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
        self.secondsLabel.text = "\(count)"
        self.progressView.setProgress(Float((count%60))/60.0, animated: true)
        self.view.backgroundColor = color
    }

}
