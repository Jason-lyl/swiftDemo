//
//  MyTableViewController.swift
//  demo
//
//  Created by Jason on 2020/7/9.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var dataSource: [SectionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0 ..< 20 {
            var rowArray = [CellModel]()
            for index1 in 0 ..< 3 {
                var model = CellModel()
                model.title = "row: \(index1)"
                rowArray.append(model)
            }
            var section = SectionModel()
            section.dataSource = rowArray
            section.title = "section: \(index)"
            dataSource.append(section)
        }
        tableView.estimatedRowHeight = 60
        tableView.estimatedSectionHeaderHeight = 40
        
        tableView.registerCell(MyTableViewCell.self)
        tableView.registerSection(MyHeaderView.self)
        tableView.reloadData()
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.dataSource[section]
        
        return model.isShow ? model.dataSource.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReusableCell(indexPath: indexPath) as MyTableViewCell
        cell.titleLabel.text = dataSource[indexPath.section].dataSource[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeReusableHeaderFooter() as MyHeaderView?
        view?.titleLabel.text = dataSource[section].title
        view?.indexPath = section
        view?.delegate = self
        return view!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

extension MyTableViewController: ButtonDelegate {
    func viewClick(indexPath: Int) {
        let show = !dataSource[indexPath].isShow
 
        dataSource[indexPath].isShow = show
        tableView.reloadSections(NSIndexSet(index: indexPath) as IndexSet, with: .automatic)
    }
    
    
}

struct CellModel {
    var height: CGFloat = 0
    var title: String = ""
}

struct SectionModel {
    var title: String = ""
    var height: CGFloat = 0
    var dataSource: [CellModel] = []
    var isShow: Bool = true
}


