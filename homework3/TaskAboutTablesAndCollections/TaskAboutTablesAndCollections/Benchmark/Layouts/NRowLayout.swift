//
//  NRowLayout.swift
//  TaskAboutTablesAndCollections
//
//  Created by Developer on 17/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class NRowLayout: UICollectionViewFlowLayout {
    
    private var rowsCount = 1
    
    init(_ rowsCount: Int) {
        super.init()
        if rowsCount < 1 {
            assert(rowsCount < 1, "Row count should be greater or equal 1")
        }
        self.rowsCount = rowsCount < 1 ? 1 : rowsCount
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.rowsCount = 1
    }
    
    override func prepare() {
        super.prepare()
        self.scrollDirection = .horizontal
        let height = (self.collectionView?.bounds.size.height ?? 0)/CGFloat(self.rowsCount)
        self.itemSize = CGSize(width: height, height: height)
        self.minimumLineSpacing = 16.0
        self.minimumInteritemSpacing = 0.0
    }
}
