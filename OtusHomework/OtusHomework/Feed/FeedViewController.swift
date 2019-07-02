//
//  FeedViewController.swift
//  TaskAboutLifecycle
//
//  Created by developer on 6/9/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private let items = Services.summaryItemsProvider.items()
    private var filteredItems = [String]()
    private let searcher = SuffixArrayManipulator()
    private var searchController: UISearchController = UISearchController(searchResultsController: nil)
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searcher.loadArray(results: SearchArrayAdapter.adapt(input: items))
        self.searchController.obscuresBackgroundDuringPresentation = true
        self.searchController.searchBar.placeholder = "Type to find data structure"
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = self.searchController
        self.definesPresentationContext = true
    }

    private func showSummaryViewController(item: String) {
        guard let controller = SessionSummaryViewController.buildFromStoryboard(item: item) else {
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showDataStructureBenchmarkViewController(item: String) {
        var viewController: UIViewController?
        switch item {
        case "Set":
            viewController = UIStoryboard(name: "DataStructures", bundle: Bundle.main).instantiateViewController(withIdentifier: "SetViewController")
        case "Array":
            viewController = UIStoryboard(name: "DataStructures", bundle: Bundle.main).instantiateViewController(withIdentifier: "SetViewController")
        case "Dictionary":
            viewController = UIStoryboard(name: "DataStructures", bundle: Bundle.main).instantiateViewController(withIdentifier: "SetViewController")
        case "Suffix Array":
            viewController = UIStoryboard(name: "Feed", bundle: Bundle.main).instantiateViewController(withIdentifier: "SuffixArrayViewController")
        default:
            break
        }
        if let controller = viewController {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    private func isSearching() -> Bool {
        return !(self.searchController.searchBar.text?.isEmpty ?? true)
    }
}

// MARK: - UITableViewDelegate

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showDataStructureBenchmarkViewController(item: self.itemAtRow(row: indexPath.row))
    }
    
}

// MARK: - UITableViewDataSource

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.itemAtRow(row: indexPath.row)
        return cell
    }
    
}

// MARK: - Items provider

extension FeedViewController {
    
    func countOfItems() -> Int {
        if self.isSearching() {
            return self.filteredItems.count
        } else {
            return self.items.count
        }
    }
    
    func itemAtRow(row: Int) -> String {
        if self.isSearching() {
            return self.filteredItems[row]
        } else {
            return self.items[row]
        }
    }
}

// MARK: - UISearchResultsUpdating

extension FeedViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        self.filteredItems = self.searcher.search(searchString: text, maxOccurencies: 0)
        self.tableView.reloadData()
    }
}

// MARK: - UISearchBarDelegate

extension FeedViewController: UISearchBarDelegate {
    
    
}
