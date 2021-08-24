//
//  ExcelSectionView.swift
//  demo
//
//  Created by Jason on 2021/4/8.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit
/// 表格头部view
class ExcelSectionView: UIView, NibLoadable {
    /// 第一行第一个标题
    @IBOutlet private weak var titleLabel: UILabel!
    /// 标题的宽度
    @IBOutlet weak var titleConstant: NSLayoutConstraint!

    @IBOutlet private weak var scrollView: UIScrollView!
    /// 每个item宽度
    private var itemWith: CGFloat = 60
    /// 数据
    private var dataSoure: [String] = []
    /// 背景
    var backColor: UIColor = .lightGray {
        didSet {
            backgroundColor = backColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViewFromNib()
    }

    func configure(_ with: CGFloat, _ items: [String]) {
        itemWith = with
        dataSoure = items
        titleConstant.constant = with
        initSubViews()
    }
}

// MARK: - ui
extension ExcelSectionView {
    func initSubViews() {
        for (index, item) in dataSoure.enumerated() {
            let lable = UILabel()
            lable.font = UIFont.systemFont(ofSize: 14)
            lable.textAlignment = .center
            lable.textColor = UIColor.darkGray
            lable.numberOfLines = 0
            lable.text = item
            lable.layer.borderWidth = 0.6
            lable.layer.borderColor = UIColor.darkGray.cgColor
            lable.frame = CGRect(x: CGFloat(index) * itemWith, y: 0, width: itemWith, height: frame.width)
            scrollView.addSubview(lable)
        }
    }
}
