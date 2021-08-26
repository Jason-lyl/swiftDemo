//
//  DrawMainViewController.swift
//  demo
//
//  Created by Jason on 2021/8/19.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit

class DrawMainViewController: UITableViewController {

    private var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataSource = ["Core Graphics"]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.reloadData()
    }
}

extension DrawMainViewController {
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
