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
    case search3symbols
    case search3symbolsWithInfiniteOccurencies
    case arrayCreation
    case arraySearch3symbols
    case arraySearch3symbolsWithInfiniteOccurencies
    case count
}

class SuffixArrayViewController: DataStructuresViewController {

    var numberOfOccurences = 1
    
    let suffixArrayManipulator = SuffixArrayManipulator()
    let arraySearchManipulator = ArraySearchManipulator()
    
    var creationTime: TimeInterval = 0
    var search3symbolsTime: TimeInterval = 0
    var search3symbolsWithInfiniteOccurenciesTime: TimeInterval = 0
    var search3symbolsWithInfiniteOccurenciesCount = 0
    
    var arrayCreationTime: TimeInterval = 0
    var arraySearch3symbolsTime: TimeInterval = 0
    var arraySearch3symbolsWithInfiniteOccurenciesTime: TimeInterval = 0
    var arraySearch3symbolsWithInfiniteOccurenciesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create SuffixArray and Test", for: UIControl.State())
        self.slider?.minimumValue = 0
        self.slider?.maximumValue = 100
        self.slider?.value = 1
        self.updateCountLabel()
    }
    
    override func updateCountLabel() {
        if numberOfOccurences == 0 {
            countLabel?.text = "Number of occurences: Infinity"
        } else {
            countLabel?.text = "Number of occurences: \(numberOfOccurences)"
        }
    }
    
    override func sliderAdjusted(_ adjustedSlider: UISlider) {
        numberOfOccurences = Int(ceil(adjustedSlider.value))
        testOnlyButton.isEnabled = false
        updateCountLabel()
    }
    
    override func create(_ size: Int) {
        creationTime = suffixArrayManipulator.loadArrayWithMeasuring()
        arrayCreationTime = arraySearchManipulator.loadArrayWithMeasuring()
    }
    
    override func test() {
        let firstTest: [String] = {
            let stringGenerator = StringGenerator()
            var tests = [String]()
            for _ in 0...9 {
                tests.append(stringGenerator.generateRandomString(3))
            }
            return tests
        }()
        
        search3symbolsTime = firstTest.reduce(TimeInterval(0)) {
            return $0 + suffixArrayManipulator.searchWithMeasuring(searchString: $1, maxOccurencies: self.numberOfOccurences).0
        }
        
        arraySearch3symbolsTime = firstTest.reduce(TimeInterval(0)) {
            return $0 + arraySearchManipulator.searchWithMeasuring(searchString: $1, maxOccurencies: self.numberOfOccurences).0
        }
        
        let fourthTest = "Sort"
        var searchResult = suffixArrayManipulator.searchWithMeasuring(searchString: fourthTest, maxOccurencies: self.numberOfOccurences)
        search3symbolsWithInfiniteOccurenciesTime = searchResult.0
        search3symbolsWithInfiniteOccurenciesCount = searchResult.1.count
        
        searchResult = arraySearchManipulator.searchWithMeasuring(searchString: fourthTest, maxOccurencies: self.numberOfOccurences)
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
        case .search3symbols:
            cell.textLabel?.text = "Suffix Array Find 3 symbols test: "
            cell.detailTextLabel?.text = formattedTime(search3symbolsTime)
        case .search3symbolsWithInfiniteOccurencies:
            cell.textLabel?.text = "Suffix Array Find + results: "
            cell.detailTextLabel?.text = "\(formattedTime(search3symbolsWithInfiniteOccurenciesTime)!) \(search3symbolsWithInfiniteOccurenciesCount)"
        case .arrayCreation:
            cell.textLabel?.text = "Search Array creation"
            cell.detailTextLabel?.text = formattedTime(arrayCreationTime)
        case .arraySearch3symbols:
            cell.textLabel?.text = "Search Array Find 3 symbols test: "
            cell.detailTextLabel?.text = formattedTime(arraySearch3symbolsTime)
        case .arraySearch3symbolsWithInfiniteOccurencies:
            cell.textLabel?.text = "Search Array Find + results: "
            cell.detailTextLabel?.text = "\(formattedTime(arraySearch3symbolsWithInfiniteOccurenciesTime)!) \(arraySearch3symbolsWithInfiniteOccurenciesCount)"
        default:
            break;
        }
        return cell
    }
}
