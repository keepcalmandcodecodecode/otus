//
//  TimerCollectionViewCell.swift
//  TaskAboutTablesAndCollections
//
//  Created by developer on 6/16/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class TimerCollectionViewCell: UICollectionViewCell {
    
    private var currentRunningCount = 0
    private var currentPausedCount = 0
    private static let pausedColor = UIColor.randomNoWhite
    private static let runningColor = UIColor.randomNoWhite
    
    static let reuseID = String(describing: TimerCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: TimerCollectionViewCell.self), bundle: nil)
    
    var willReuse: (() -> Void)?

    @IBOutlet var pieChartView: PieChartView!
    @IBOutlet var secondsLabel: UILabel!
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.pieChartView.radius = 1000
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.willReuse?()
        self.secondsLabel.text = ""
    }

    func configureWithState(isRunning: Bool, runningCount: Int, pausedCount: Int) {
        self.secondsLabel.text = "\(runningCount)"
        self.currentRunningCount = runningCount
        self.currentPausedCount = pausedCount
    }
    
    func refreshPieChart() {
        self.pieChartView.items = [PieChartItem(color: TimerCollectionViewCell.runningColor, text: "running", value: self.currentRunningCount), PieChartItem(color: TimerCollectionViewCell.pausedColor, text: "paused", value: currentPausedCount)]
        self.pieChartView.setNeedsDisplay()
    }

}
