//
//  NLineColumnLayout.swift
//  TaskAboutTablesAndCollections
//
//  Created by Developer on 17/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class NColumnLayout: UICollectionViewFlowLayout {

    private var columnsCount = 1
    
    init(_ columnsCount: Int) {
        super.init()
        if columnsCount < 1 {
            assert(columnsCount < 1, "Column count should be greater or equal 1")
        }
        self.columnsCount = columnsCount < 1 ? 1 : columnsCount
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.columnsCount = 1
    }
    
    override func prepare() {
        super.prepare()
        self.scrollDirection = .vertical
        let width = (self.collectionView?.bounds.size.width ?? 0)/CGFloat(self.columnsCount)
        self.itemSize = CGSize(width: width, height: width)
        self.minimumLineSpacing = 16.0
        self.minimumInteritemSpacing = 0.0
    }
}
