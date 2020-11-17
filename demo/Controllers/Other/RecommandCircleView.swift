//
//  RecommandCircleView.swift
//  demo
//
//  Created by Jason on 2020/11/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class RecommandCircleView: UIView {


    let lineWidth: CGFloat = 20
    var circlePath = UIBezierPath()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
    }

    func addCircleWithProgress(_ progress: CGFloat) {
        
        // 画路径
         circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5), radius: (self.frame.size.width - lineWidth) * 0.5, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi + CGFloat.pi / 2, clockwise: true)
        // 先画一个背景环
        let bgLayer = CAShapeLayer()
        bgLayer.frame = self.bounds
        bgLayer.fillColor = UIColor.clear.cgColor
        bgLayer.lineWidth = lineWidth
        bgLayer.strokeColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1).cgColor
        bgLayer.strokeStart = 0
        bgLayer.strokeEnd = 1
        bgLayer.lineCap = .round
        bgLayer.path = circlePath.cgPath
        layer.addSublayer(bgLayer)
        
        addOtherLayer(startProgress: 0, endProgress: 0.3)
        addOtherLayer(startProgress: 0.35, endProgress: 0.8)
        addOtherLayer(startProgress: 0.85, endProgress: 0.95)



    }
    
    func addOtherLayer(startProgress: CGFloat, endProgress: CGFloat) {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0.4588235294, blue: 0.4509803922, alpha: 1).cgColor
        shapeLayer.strokeStart = startProgress
        shapeLayer.strokeEnd = endProgress

        // 增加动画
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 1
        pathAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        pathAnimation.fromValue = 0
        pathAnimation.toValue = endProgress
        pathAnimation.autoreverses = false
        pathAnimation.repeatCount = 1
        shapeLayer.add(pathAnimation, forKey: "strokeEndAnimation")
        shapeLayer.path = circlePath.cgPath
        layer.addSublayer(shapeLayer)

        //渐变色
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width / 2, height: self.frame.size.height)
        gradientLayer.colors = [#colorLiteral(red: 1, green: 0.4588235294, blue: 0.4509803922, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.7450980392, blue: 0.6078431373, alpha: 1).cgColor]
        gradientLayer.locations = [NSNumber(value: 0), NSNumber(value: 1)]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.mask = shapeLayer
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
}

