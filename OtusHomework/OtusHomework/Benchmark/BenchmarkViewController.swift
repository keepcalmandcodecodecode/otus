//
//  BenchmarkViewController.swift
//  TaskAboutLifecycle
//
//  Created by developer on 6/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit



class BenchmarkViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    private var timerItems: [TimerItem] = []
    private var layoutController: LayoutController?
    
    // MARK: UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(TimerCollectionViewCell.nib, forCellWithReuseIdentifier: TimerCollectionViewCell.reuseID)
        let refreshChartsBarButtonItem = UIBarButtonItem(title: "Update charts", style: .plain, target: self, action: #selector(updateCharts))
        let changeLayoutBarButtonItem = UIBarButtonItem(title: "Change layout", style: .plain, target: self, action: #selector(changeLayout))
        self.navigationItem.rightBarButtonItems = [refreshChartsBarButtonItem, changeLayoutBarButtonItem]
        self.layoutController = LayoutController(collectionView: collectionView, layouts: Services.benchmarkLayoutProvider.items())
        self.layoutController?.updateLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timerItems = Services.timerItemsProvider.items()
        self.collectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for timerItem in self.timerItems {
            timerItem.reset()
        }
    }
    
    @objc func changeLayout() {
        self.layoutController?.changeLayout()
    }
    
    @objc func updateCharts() {
        guard let cells = self.collectionView.visibleCells as? [TimerCollectionViewCell] else {
            return
        }
        cells.forEach { $0.refreshPieChart() }
    }

}

// MARK: - UICollectionViewDelegate
extension BenchmarkViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let timerItem = self.timerItems[indexPath.row]
        if timerItem.isRunning {
            timerItem.pause()
        } else {
            timerItem.run()
        }
    }
    
}

// MARK: - UICollectionViewDatasource
extension BenchmarkViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timerItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimerCollectionViewCell.reuseID, for: indexPath) as? TimerCollectionViewCell else {
            return UICollectionViewCell(frame: .zero)
        }
        
        let timerItem = self.timerItems[indexPath.row]
        
        weak var weakCell = cell
        timerItem.stateDidUpdated = { isRunning, runningCount, pausedCount in
            weakCell?.configureWithState(isRunning: isRunning, runningCount: runningCount, pausedCount: pausedCount)
            weakCell?.refreshPieChart()
        }
        weak var weakTimer = timerItem
        cell.willReuse = {
            weakTimer?.stateDidUpdated = nil
        }
        cell.refreshPieChart()
        return cell
    }
    
}
