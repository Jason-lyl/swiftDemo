//
//  MyHeaderView.swift
//  demo
//
//  Created by Jason on 2020/7/9.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

protocol ButtonDelegate: class {
    func viewClick(indexPath: Int)
}

class MyHeaderView: UITableViewHeaderFooterView,CellConfigurable {
    

    @IBOutlet weak var titleLabel: UILabel!
    
    var indexPath: Int = 0
    
    weak var delegate: ButtonDelegate?
    
    static var nib: UINib? {
        return UINib(nibName: reuseableIdentifier, bundle: nil)
    }

    func configure(_ item: String) {
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        delegate?.viewClick(indexPath: indexPath)
    }
}


extension UITableView {
    func registerCell<C: UITableViewCell>(_ cell: C.Type) where C: CellReusable {
        if let nib = C.nib {
            register(nib, forCellReuseIdentifier: C.reuseableIdentifier)
        } else {
            register(cell, forCellReuseIdentifier: C.reuseableIdentifier)
        }
    }

    func dequeReusableCell<C: UITableViewCell>(indexPath: IndexPath) -> C where C: CellReusable {
        // swiftlint:disable force_cast
        return dequeueReusableCell(withIdentifier: C.reuseableIdentifier, for: indexPath) as! C
    }

    func cellForRow<C>(at indexPath: IndexPath) -> C? where C: CellConfigurable {
        return self.cellForRow(at: indexPath) as? C
    }

    func registerSection<H: UIView>(_ header: H.Type) where H: CellConfigurable {
        if let nib = header.nib {
            register(nib, forHeaderFooterViewReuseIdentifier: H.reuseableIdentifier)
        } else {
            register(header, forHeaderFooterViewReuseIdentifier: H.reuseableIdentifier)
        }
    }

    func dequeReusableHeaderFooter<H: UIView>() -> H? where H: CellConfigurable {
        return dequeueReusableHeaderFooterView(withIdentifier: H.reuseableIdentifier) as? H
    }
}

/// Cell快速注册，获取协议
protocol CellReusable: class {
    static var reuseableIdentifier: String {get}
    static var nib: UINib? {get}
}

extension CellReusable where Self: UITableViewCell {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }

    static var nib: UINib? {
        return nil
    }
}

extension CellReusable where Self: UITableViewHeaderFooterView {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }

    static var nib: UINib? {
        return nil
    }
}

extension CellReusable where Self: UICollectionViewCell {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }

    static var nib: UINib? {
        return nil
    }
}

extension CellReusable where Self: UICollectionReusableView {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }

    static var nib: UINib? {
        return nil
    }
}

/// Cell配置数据协议
protocol CellConfigurable: CellReusable {
    associatedtype T
    func configure(_ item: T)
}

