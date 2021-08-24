//
//  CollectionViewCell.swift
//  demo
//
//  Created by Jason on 2020/11/30.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, CellConfigurable {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    func configure(_ item: CellData) {
        imageView.image = item.image

    }
    
    static var nib: UINib? {
        return UINib(nibName: reuseableIdentifier, bundle: nil)
    }

    
}

struct CollectItem {
    var color: UIColor = .black
    var title: String = ""
}

struct CellData {

    let image: UIImage
    let title: String
}

