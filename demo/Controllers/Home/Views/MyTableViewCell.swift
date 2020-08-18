//
//  MyTableViewCell.swift
//  demo
//
//  Created by Jason on 2020/7/9.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell, CellConfigurable {
    

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item: String) {
        
    }
    
    static var nib: UINib? {
        return UINib(nibName: reuseableIdentifier, bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
