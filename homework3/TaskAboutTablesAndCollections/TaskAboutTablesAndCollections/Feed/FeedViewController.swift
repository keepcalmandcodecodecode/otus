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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func showSummaryViewController(item: String) {
        guard let controller = SessionSummaryViewController.buildFromStoryboard(item: item) else {
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showSummaryViewController(item: self.items[indexPath.row])
    }
    
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
}
