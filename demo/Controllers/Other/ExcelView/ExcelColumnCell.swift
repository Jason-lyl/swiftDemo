//
//  ExcelColumnCell.swift
//  demo
//
//  Created by Jason on 2021/4/8.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit

class ExcelColumnCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var nib: UINib? {
        return UINib(nibName: reuseableIdentifier, bundle: nil)
    }

    func configure(_ item: String) {
        titleLabel.text = item
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
