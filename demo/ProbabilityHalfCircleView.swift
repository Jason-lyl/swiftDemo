//
//  ProbabilityHalfCircleView.swift
//  YouZhiYuan
//
//  Created by Jason on 2020/6/16.
//  Copyright © 2020 泽i. All rights reserved.
//

import UIKit

class ProbabilityHalfCircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    
    func initSubViews() {
        let width = self.bounds.width
        let height = self.bounds.height
        
        let center = CGPoint(x: width / 2, y: height - CGFloat(tanf(.pi / 3)) * width / 2 - 10)
        let path = UIBezierPath(arcCenter: center, radius: width , startAngle: 0, endAngle: 1.5 * .pi, clockwise: true)
        let  progressLayer = CAShapeLayer()
        progressLayer.frame = self.bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.black.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 20
        progressLayer.path = path.cgPath
        //进度条默认结束位置是0
        progressLayer.strokeEnd = 0.8
        //将进度条添加到视图层中
        self.layer.addSublayer(progressLayer)
        
        //绘制左侧的渐变层（从上往下是：由黄变蓝）
        let gradientLayer1 = CAGradientLayer()
        let heightY = self.bounds.height - 30
        gradientLayer1.frame = CGRect(x:0, y:heightY, width:self.frame.width / 2,
                                      height:50)
        gradientLayer1.colors = [#colorLiteral(red: 0.4588235294, green: 0.4823529412, blue: 1, alpha: 1),#colorLiteral(red: 0.4588235294, green: 0.4823529412, blue: 1, alpha: 1)].map { $0.cgColor }
        
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = CGRect(x:self.frame.width / 2, y:heightY, width:self.frame.width / 2,
                                      height:50)
        gradientLayer2.colors = [#colorLiteral(red: 0.3176470588, green: 0.1098039216, blue: 0.7058823529, alpha: 1), #colorLiteral(red: 0.3176470588, green: 0.1098039216, blue: 0.7058823529, alpha: 1)].map { $0.cgColor }
        
        
        //用于存放左右两侧的渐变层，并统一添加到视图层中
        let gradientLayer = CALayer()
        gradientLayer.addSublayer(gradientLayer1)
        gradientLayer.addSublayer(gradientLayer2)

        self.layer.addSublayer(gradientLayer)
        
        //将渐变层的遮罩设置为进度条
        gradientLayer.mask = progressLayer
        
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        //使用rgb颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        //颜色数组（这里使用三组颜色作为渐变）fc6820
        let colors: [CGColor] = [#colorLiteral(red: 0.4588235294, green: 0.4823529412, blue: 1, alpha: 1), #colorLiteral(red: 0.3176470588, green: 0.1098039216, blue: 0.7058823529, alpha: 1)].map { $0.cgColor }
        
        let compoents: [CGFloat] = colors.map { $0.components }.compactMap { $0 }.reduce([], +)
        //没组颜色所在位置（范围0~1)
        let locations: [CGFloat] = [0, 1]
        //生成渐变色（count参数表示渐变个数
        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: compoents,
                                  locations: locations, count: locations.count)!
        //渐变开始位置
        let start = CGPoint(x: 0, y: rect.height - 30)
        //渐变结束位置
        let end = CGPoint(x: rect.width, y: rect.height - 30)
        //绘制渐变
        context.drawLinearGradient(gradient, start: start, end: end,
                                   options: .drawsBeforeStartLocation)
        
        
    }
    
    
    
}
