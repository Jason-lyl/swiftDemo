//
//  ExcelViewCell.swift
//  demo
//
//  Created by Jason on 2021/4/8.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit

class ExcelViewCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var stackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ items: [String]) {

        for item in items {
            let lable = UILabel()
            lable.font = UIFont.systemFont(ofSize: 14)
            lable.textColor = UIColor.darkGray
            lable.numberOfLines = 0
            lable.text = item
            lable.layer.borderWidth = 0.6
            lable.layer.borderColor = UIColor.darkGray.cgColor
            stackView.addArrangedSubview(lable)
        }
    }

    static var nib: UINib? {
        return UINib(nibName: reuseableIdentifier, bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
