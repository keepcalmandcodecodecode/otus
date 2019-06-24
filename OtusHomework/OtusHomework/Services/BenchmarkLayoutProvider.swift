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
            NRowLayout(2),
            NRowLayout(3),
            NColumnLayout(2),
            NColumnLayout(3)]
    }
    
}
