//
//  ProgressView.swift
//  demo
//
//  Created by Jason on 2020/6/18.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    //进度条宽度
    let lineWidth: CGFloat = 6
    //进度槽颜色
    let trackColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0,
                             alpha: 1)
    //进度条颜色
    let progressColoar = UIColor.orange
    
    //进度槽
    let trackLayer = CAShapeLayer()
    //进度条
    let progressLayer = CAShapeLayer()
    //进度条路径（整个圆圈）
    let path = UIBezierPath()
    
    //当前进度
    var progress: Int = 0 {
        didSet {
            if progress > 100 {
                progress = 100
            }else if progress < 0 {
                progress = 0
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        //获取整个进度条圆圈路径
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: bounds.size.width/2 - lineWidth,
                    startAngle: angleToRadian(-90), endAngle: angleToRadian(270), clockwise: true)
        
        //绘制进度槽
        trackLayer.frame = bounds
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = lineWidth
        trackLayer.path = path.cgPath
        layer.addSublayer(trackLayer)
        
        //绘制进度条
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColoar.cgColor
        progressLayer.lineWidth = lineWidth
        progressLayer.path = path.cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = CGFloat(progress)/100.0
        layer.addSublayer(progressLayer)
    }
    
    //设置进度（可以设置是否播放动画）
    func setProgress(_ pro: Int, _ animated: Bool) {
        progress = pro
        if animated {
            let animation = CABasicAnimation.init(keyPath: "strokeEnd")
            animation.fromValue = 0.0
            animation.toValue = CGFloat(progress)/100.0
            animation.duration = 0.8
            progressLayer.add(animation, forKey: nil)
            animation.delegate = self
        } else {
            progressLayer.strokeEnd = CGFloat(progress)/100.0
        }
    }
    
    //将角度转为弧度
    fileprivate func angleToRadian(_ angle: Double)->CGFloat {
        return CGFloat(angle/Double(180.0) * .pi)
    }
}

extension ProgressView:CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        progressLayer.strokeEnd = CGFloat(progress)/100.0

    }
}
