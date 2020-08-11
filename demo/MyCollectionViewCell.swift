//
//  MyCollectionViewCell.swift
//  demo
//
//  Created by Jason on 2020/8/3.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = false
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
