//
//  LayoutController.swift
//  TaskAboutTablesAndCollections
//
//  Created by Developer on 17/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class LayoutController {
    
    private weak var collectionView: UICollectionView?
    
    init(collectionView: UICollectionView?, layouts: [UICollectionViewLayout]) {
        self.layouts = layouts
        self.collectionView = collectionView
    }
    
    private var layouts: [UICollectionViewLayout] = [NColumnLayout(1)]
    private var currentLayoutIndex = 0
    
    public func updateLayout() {
        self.collectionView?.setCollectionViewLayout(self.layouts[currentLayoutIndex], animated: true)
    }
    
    func changeLayout() {
        let nextLayoutIndex = self.currentLayoutIndex + 1
        if nextLayoutIndex >= self.layouts.count {
            self.currentLayoutIndex = 0
        } else {
            self.currentLayoutIndex = nextLayoutIndex
        }
        self.updateLayout()
    }
}
