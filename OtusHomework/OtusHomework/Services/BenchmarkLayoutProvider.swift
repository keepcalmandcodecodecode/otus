//
//  BenchmarkLayoutProvider.swift
//  TaskAboutTablesAndCollections
//
//  Created by Developer on 17/06/2019.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

struct BenchmarkLayoutProvider {

    func items() -> [UICollectionViewLayout] {
        return [
            StagLayout(widthHeightRatios: [(CGFloat(0.2), CGFloat(0.6))], itemSpacing: CGFloat(8.0)),
            NRowLayout(1),
            NRowLayout(2),
            NRowLayout(3),
            NRowLayout(4),
            NRowLayout(5),
            NColumnLayout(1),
            NColumnLayout(2),
            NColumnLayout(3),
            NColumnLayout(4),
            NColumnLayout(5)]
    }
    
}
