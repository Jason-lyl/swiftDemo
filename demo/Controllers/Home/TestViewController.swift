//
//  TestViewController.swift
//  demo
//
//  Created by Jason on 2021/8/24.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit
import ExternalAccessory

class TestViewController: UITableViewController {

    private var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.reloadData()
    }

    func scan() {
        let accessoryBrowser = EAWiFiUnconfiguredAccessoryBrowser.init(delegate: self, queue: .main)
        let browser = UnconfiguredExternalAccessoryBrowser.init(predicate: nil, browser: accessoryBrowser)
        browser
        .sink { event in
            switch event {
            case let .didFindUnconfiguredAccessories(accessories):
                break
                // Add to your list
            case let .didRemoveUnconfiguredAccessories(accessories): break
                // Remove from your list
            }
        }
    }
}

extension TestViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = DrawGraphicsViewController()
            navigationController?.pushViewController(vc, animated: false)
        default:
            break
        }
    }
}

