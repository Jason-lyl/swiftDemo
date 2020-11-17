//
//  HeaderCircleView.swift
//  demo
//
//  Created by Jason on 2020/11/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.size.width


class HeaderCircleView: UIView {
    
    private let leftEdge: CGFloat = 100

    /// 间隔
    private let lineWidth: CGFloat = 20
    /// 最小圆半径
    private let smallRadius: CGFloat = 10
    
    /// 大圆半径
    private var bigRadius: CGFloat = 0
    /// 中间圆半径
    private var middleRadius: CGFloat = 0

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        bigRadius = (frame.width - leftEdge * 2) / 2
        middleRadius = (frame.width - leftEdge * 2 - lineWidth * 2) / 2
        self.backgroundColor = UIColor.red
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
    }
    
    override func draw(_ rect: CGRect) {
        draw(startProgress: 0, endProgress: 0.6)
    }
    
    func draw(startProgress: CGFloat ,endProgress: CGFloat) {
        
        let startAngle = startProgress * CGFloat.pi
    
        let endAngle = endProgress * CGFloat.pi
        
        UIColor.red.setFill()
        
        let path = UIBezierPath.init()
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        
        let centerPoint = CGPoint(x: bigRadius + leftEdge, y: bigRadius + leftEdge)
        path.addArc(withCenter: centerPoint, radius: bigRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // 中间小圆
        let firstCenter = CGPoint(x: middleRadius * 2 + lineWidth + leftEdge + smallRadius, y: ScreenW / 2)
//        path.addArc(withCenter: CGPoint(x: middleRadius * 2 + lineWidth + leftEdge + smallRadius, y: ScreenW / 2), radius: smallRadius, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        
//        path.addArc(withCenter: centerPoint, radius: middleRadius, startAngle: 0, endAngle: CGFloat.pi * 5 / 3, clockwise: false)
        
        let pointX = cos(CGFloat.pi / 3) * (bigRadius - smallRadius) + bigRadius + leftEdge
        let pointY = ScreenW / 2 - sin(CGFloat.pi / 3) * (bigRadius - smallRadius)
        //结尾小圆
//        path.addArc(withCenter: CGPoint(x: pointX, y: pointY), radius: 10, startAngle: CGFloat.pi * 5 / 3, endAngle: CGFloat.pi * 2 / 3, clockwise: true)
        path.fill()
        
        let otherPath = UIBezierPath.init(arcCenter: CGPoint(x: pointX, y: pointY), radius: smallRadius, startAngle: CGFloat.pi * 5 / 3, endAngle: CGFloat.pi * 2 / 3, clockwise: true)
        UIColor.white.setFill()
//        otherPath.fill()
    }
    
    func myDraw() {
        
        let radius :CGFloat = 10
        UIColor.brown.setFill()
        UIColor.yellow.setStroke()
        let offset :CGFloat = 40
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 10 + offset, y: 10))
        bezierPath.addLine(to: CGPoint(x: 100 + offset, y: 10))
        
        bezierPath.addArc(withCenter: CGPoint(x: 100 + offset, y: 10 + radius), radius: radius, startAngle: CGFloat(-Double.pi/2.0), endAngle: 0, clockwise: true)
        bezierPath.addArc(withCenter: CGPoint(x: 100 + offset, y: 100), radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi/2.0), clockwise: true)
        bezierPath.addArc(withCenter:CGPoint(x: 50 + offset , y: 100 + radius + radius), radius: radius, startAngle: CGFloat(-Double.pi/2.0), endAngle: CGFloat(-Double.pi), clockwise: false)
        bezierPath.addArc(withCenter:CGPoint(x: 50 - radius - radius + offset , y: 140 + radius + radius), radius: radius, startAngle:0, endAngle: CGFloat(Double.pi/2), clockwise: true)
        bezierPath.addArc(withCenter: CGPoint(x: 10 + offset - radius, y: 140 + radius + radius  ), radius: radius, startAngle: CGFloat(Double.pi/2.0), endAngle: CGFloat(Double.pi), clockwise: true)
        
        bezierPath.addArc(withCenter: CGPoint(x: 10 + offset - radius , y: 10 + radius), radius: radius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(Double.pi) * 3 / 2, clockwise: true)
        bezierPath.addLine(to:  CGPoint(x: 10 + offset, y: 10))
        
        bezierPath.lineWidth = 2.0
        bezierPath.setLineDash([3,2], count: 2, phase: 0)
        bezierPath.stroke()
        bezierPath.fill()
    }
    

}
