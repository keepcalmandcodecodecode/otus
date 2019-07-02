//
//  SuffixArrayViewController.swift
//  OtusHomework
//
//  Created by developer on 7/1/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

private enum Rows: Int {
    case creation = 0
    case search3symbols1
    case search3symbols2
    case search3symbols3
    case search3symbolsWithInfiniteOccurencies
    case arrayCreation
    case arraySearch3symbols1
    case arraySearch3symbols2
    case arraySearch3symbols3
    case arraySearch3symbolsWithInfiniteOccurencies
    case count
}

class SuffixArrayViewController: DataStructuresViewController {

    let suffixArrayManipulator = SuffixArrayManipulator()
    let arraySearchManipulator = ArraySearchManipulator()
    
    var creationTime: TimeInterval = 0
    var search3symbols1Time: TimeInterval = 0
    var search3symbols2Time: TimeInterval = 0
    var search3symbols3Time: TimeInterval = 0
    var search3symbolsWithInfiniteOccurenciesTime: TimeInterval = 0
    var search3symbolsWithInfiniteOccurenciesCount = 0
    
    var arrayCreationTime: TimeInterval = 0
    var arraySearch3symbols1Time: TimeInterval = 0
    var arraySearch3symbols2Time: TimeInterval = 0
    var arraySearch3symbols3Time: TimeInterval = 0
    var arraySearch3symbolsWithInfiniteOccurenciesTime: TimeInterval = 0
    var arraySearch3symbolsWithInfiniteOccurenciesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create SuffixArray and Test", for: UIControl.State())
    }
    
    override func create(_ size: Int) {
        creationTime = suffixArrayManipulator.loadArrayWithMeasuring()
        arrayCreationTime = arraySearchManipulator.loadArrayWithMeasuring()
    }
    
    override func test() {
        let firstTest = "abc"
        search3symbols1Time = suffixArrayManipulator.searchWithMeasuring(searchString: firstTest).0
        arraySearch3symbols1Time = arraySearchManipulator.searchWithMeasuring(searchString: firstTest).0
        
        let secondTest = "abc"
        search3symbols2Time = suffixArrayManipulator.searchWithMeasuring(searchString: secondTest).0
        arraySearch3symbols2Time = arraySearchManipulator.searchWithMeasuring(searchString: secondTest).0
        
        let thirdTest = "abc"
        search3symbols3Time = suffixArrayManipulator.searchWithMeasuring(searchString: thirdTest).0
        arraySearch3symbols3Time = arraySearchManipulator.searchWithMeasuring(searchString: thirdTest).0
        
        let fourthTest = "Sort"
        var searchResult = suffixArrayManipulator.searchWithMeasuring(searchString: fourthTest, maxOccurencies: 0)
        search3symbolsWithInfiniteOccurenciesTime = searchResult.0
        search3symbolsWithInfiniteOccurenciesCount = searchResult.1.count
        
        searchResult = arraySearchManipulator.searchWithMeasuring(searchString: fourthTest, maxOccurencies: 0)
        arraySearch3symbolsWithInfiniteOccurenciesTime = searchResult.0
        arraySearch3symbolsWithInfiniteOccurenciesCount = searchResult.1.count
    }
    
    // MARK: UITableViewDatasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rows.count.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        guard let row = Rows(rawValue: indexPath.row) else {
            return cell
        }
        
        switch row {
        case .creation:
            cell.textLabel?.text = "Suffix Array creation"
            cell.detailTextLabel?.text = formattedTime(creationTime)
        case .search3symbols1:
            cell.textLabel?.text = "Suffix Array Find 3 symbols test 1: "
            cell.detailTextLabel?.text = formattedTime(search3symbols1Time)
        case .search3symbols2:
            cell.textLabel?.text = "Suffix Array Find 3 symbols test 2: "
            cell.detailTextLabel?.text = formattedTime(search3symbols2Time)
        case .search3symbols3:
            cell.textLabel?.text = "Suffix Array Find 3 symbols test 3: "
            cell.detailTextLabel?.text = formattedTime(search3symbols3Time)
        case .search3symbolsWithInfiniteOccurencies:
            cell.textLabel?.text = "Suffix Array Find + results: "
            cell.detailTextLabel?.text = "\(formattedTime(search3symbols3Time)!) \(search3symbolsWithInfiniteOccurenciesCount)"
        case .arrayCreation:
            cell.textLabel?.text = "Search Array creation"
            cell.detailTextLabel?.text = formattedTime(arrayCreationTime)
        case .arraySearch3symbols1:
            cell.textLabel?.text = "Search Array Find 3 symbols test 1: "
            cell.detailTextLabel?.text = formattedTime(arraySearch3symbols1Time)
        case .arraySearch3symbols2:
            cell.textLabel?.text = "Search Array Find 3 symbols test 2: "
            cell.detailTextLabel?.text = formattedTime(arraySearch3symbols2Time)
        case .arraySearch3symbols3:
            cell.textLabel?.text = "Search Array Find 3 symbols test 3: "
            cell.detailTextLabel?.text = formattedTime(arraySearch3symbols3Time)
        case .arraySearch3symbolsWithInfiniteOccurencies:
            cell.textLabel?.text = "Search Array Find + results: "
            cell.detailTextLabel?.text = "\(formattedTime(arraySearch3symbols3Time)!) \(arraySearch3symbolsWithInfiniteOccurenciesCount)"
        default:
            break;
        }
        return cell
    }
}
