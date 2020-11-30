//
//  CollectionViewCell.swift
//  demo
//
//  Created by Jason on 2020/11/30.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, CellConfigurable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item: CollectItem) {
        backView.backgroundColor = item.color
        titleLabel.text = item.title
    }
    
    static var nib: UINib? {
        return UINib(nibName: reuseableIdentifier, bundle: nil)
    }

}

struct CollectItem {
    var color: UIColor = .black
    var title: String = ""
}
