//
//  ShadowViewController.swift
//  demo
//
//  Created by Jason on 2020/8/3.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class ShadowViewController: UICollectionViewController {
    let bgColor: [UIColor] = [UIColor.red, UIColor.orange, UIColor.brown, UIColor.green, UIColor.yellow, UIColor.purple]
    let offsets: [CGSize] = [CGSize(width: 0, height: 0), CGSize(width: 10, height: 10), CGSize(width: 10, height: 0), CGSize(width: 0, height: 10), CGSize(width: -10, height: -10), CGSize(width: -10, height: 0)]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib.init(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
        collectionView.reloadData()
        
    }
    
}

extension ShadowViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bgColor.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.bgView.backgroundColor = bgColor[indexPath.item]
        cell.bgView.addShadow(color: .darkGray, offset: offsets[indexPath.item], opacity: 1, radius: 3)
        cell.titleLabel.text = "CGSize(\(Int(offsets[indexPath.item].width)),\(Int(offsets[indexPath.item].height)))"
        return cell
        
    }
            // 设置圆角
    //        let maskPath = UIBezierPath(roundedRect:self.bounds, byRoundingCorners: [UIRectCorner.bottomLeft, UIRectCorner.bottomRight], cornerRadii: CGSize(width: 8, height: 8))
    //        let maskLayer = CAShapeLayer()
    //        maskLayer.frame = self.bounds
    //        maskLayer.path = maskPath.cgPath
    //        self.layer.mask = maskLayer
}

extension UIView {
    
    /// 设置阴影
    /// - Parameters:
    ///   - color: 阴影颜色
    ///   - offset: 阴影偏移量
    ///   - opacity: 阴影透明度
    ///   - radius: 阴影半径
    func addShadow(color: UIColor, offset:CGSize, opacity:Float, radius:CGFloat) {
        self.clipsToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
