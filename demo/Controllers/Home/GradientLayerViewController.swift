//
//  GradientLayerViewController.swift
//  demo
//
//  Created by Jason on 2020/12/14.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class GradientLayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let startArray: [CGPoint] = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0.5, y: 0),
            CGPoint(x: 0.5, y: 0),
            CGPoint(x: 0, y: 0.5),
            CGPoint(x: 0, y: 0.5),
            CGPoint(x: 1, y: 0.5),
            CGPoint(x: 1, y: 0.5),
            CGPoint(x: 0.5, y: 1),
            CGPoint(x: 0.5, y: 1),
        ]
        
        for index in 0 ..< 6 {
            let subView = UIView.init(frame: CGRect(x: 20, y: 100 + (60 + 20) * index, width: Int(kScreenWidth) - 40, height: 60))
            subView.backgroundColor = .white
            switch index {
            case 0:
                subView.addGradent(startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
            case 1:
                subView.addGradent1(startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
            case 2:
                subView.addGradent(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
            case 3:
                subView.addGradent(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0.5, y: 0.5))
            case 4:
                subView.addGradent(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
            case 5:
                subView.addGradent(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))

            default:
                break
            }
            
            let lable = UILabel()
            lable.textColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
            lable.font = UIFont.systemFont(ofSize: 16)
            subView.addSubview(lable)
            lable.snp.makeConstraints { (make) in
                make.center.equalTo(subView)
                make.height.equalTo(20)
                
            }

            view.addSubview(subView)
        }

    }
    


}

extension UIView {
    func addGradent(startPoint: CGPoint, endPoint: CGPoint) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ #colorLiteral(red: 1, green: 0.3137254902, blue: 0.3254901961, alpha: 1).cgColor, #colorLiteral(red: 0.9137254902, green: 0.1882352941, blue: 0.1764705882, alpha: 1).cgColor,]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    func addGradent1(startPoint: CGPoint, endPoint: CGPoint) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ #colorLiteral(red: 1, green: 0.3137254902, blue: 0.3254901961, alpha: 1).cgColor, #colorLiteral(red: 0.9137254902, green: 0.1882352941, blue: 0.1764705882, alpha: 1).cgColor,]
        gradientLayer.locations = [0, 0.1]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

}

