//
//  ExcelView.swift
//  demo
//
//  Created by Jason on 2021/4/8.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit

/// 表格组件
class ExcelView: UIView, NibLoadable {

    // MARK: - public
    /// 是否锁定第一列标题
    var isLockFristColumn: Bool = false
    /// 第一列标题数据，有值显示，没有隐藏
    var leftColumnTitltes: [String] = []
    /// 第一行标题数据
    var topRowTitles: [String] = []
    /// 表格宽度
    var formWith: CGFloat = 100
    /// 表格高度
    var formHeight: CGFloat = 60

    // MARK: - private
    /// 左边第一列视图
    @IBOutlet private weak var columnTableView: UITableView!
    /// 主scrollView
    @IBOutlet private weak var scrollView: UIScrollView!
    /// 表格头部view
    @IBOutlet private weak var sectionView: ExcelSectionView!
    /// 表格数据
    private var dataSource: [[String]] = []
    /// 表格主视图
    private lazy var tableView: UITableView = {
        let view = UITableView.init(frame: .zero, style: .plain)
        view.delegate = self
        view.dataSource = self
        view.estimatedRowHeight = 48
        view.estimatedSectionHeaderHeight = 40
        view.separatorStyle = .none
        view.sectionFooterHeight = 0.01
        view.registerCell(ExcelViewCell.self)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViewFromNib()
    }
}

extension ExcelView {
    func configure(_ items: [[String]]) {
        dataSource = items
    }
}

private extension ExcelView {
    func initSubViews() {
        columnTableView.isHidden = leftColumnTitltes.isEmpty
        if !leftColumnTitltes.isEmpty {
            initColumnTableView()
        }
        
    }

    func initColumnTableView() {
        columnTableView.registerCell(ExcelColumnCell.self)
        columnTableView.separatorStyle = .none
        columnTableView.delegate = self
        columnTableView.dataSource = self
        columnTableView.estimatedRowHeight = formHeight
        columnTableView.rowHeight = UITableView.automaticDimension
        columnTableView.reloadData()
    }
}

extension ExcelView: UITableViewDelegate {
    
}

extension ExcelView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == columnTableView {
            let cell = tableView.dequeReusableCell(indexPath: indexPath) as ExcelColumnCell
            return cell
        }
        
        let cell = tableView.dequeReusableCell(indexPath: indexPath) as ExcelViewCell
        return cell
    }

}
