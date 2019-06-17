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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(TimerCollectionViewCell.nib, forCellWithReuseIdentifier: TimerCollectionViewCell.reuseID)
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
        cell.configureWithState(isRunning: timerItem.isRunning, count: timerItem.count)
        weak var weakCell = cell
        timerItem.stateDidUpdated = { isRunning, count in
            weakCell?.configureWithState(isRunning: isRunning, count: count)
        }
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension BenchmarkViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let width = collectionView.frame.size.width - padding
        
        return CGSize(width: width/2, height: width/4)
    }
    
}
