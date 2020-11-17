//
//  RecommandHeaderCircleView.swift
//  demo
//
//  Created by Jason on 2020/11/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class RecommandHeaderCircleView: UIView {

    /// 数据源
    var dataSource: [HeaderCircle] = []
    
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
        self.backgroundColor = UIColor.white
        bigRadius = (frame.width - leftEdge * 2) / 2
        middleRadius = (frame.width - leftEdge * 2 - lineWidth * 2) / 2
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
    }

    func addCircleWithProgress() {
        
        let dataArray: [CGFloat] = [0.3]
        
        for (index, item) in dataArray.enumerated() {
            
            var model = HeaderCircle()
            switch index {
            case 0:
                model.startAngle = 0
                model.endAngle = item * CGFloat.pi * 2
                model.type = .bao
            case 1:
                model.startAngle = dataArray[0] * CGFloat.pi * 2
                model.endAngle = (dataArray[0] + item) * CGFloat.pi * 2
                model.type = .chong
            case 2:
                model.startAngle = (dataArray[0] + dataArray[1]) * CGFloat.pi * 2
                model.endAngle = CGFloat.pi * 2
                model.type = .wen
            default:
                break
            }
            dataSource.append(model)
        }
        
        for item in dataSource {
            drawLayer(item)
        }
        
        
    }
    
    func drawLayer(_ item: HeaderCircle) {
        
        let centerPoint = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        let bezierPath = UIBezierPath(arcCenter: centerPoint, radius: bigRadius, startAngle: item.startAngle, endAngle: item.endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0.4588235294, blue: 0.4509803922, alpha: 1).cgColor
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 1
        shapeLayer.path = bezierPath.cgPath
        layer.addSublayer(shapeLayer)



        let smallCenter = CGPoint(x: centerPoint.x + (middleRadius + smallRadius) * cos(item.startAngle), y: centerPoint.y + (middleRadius +  smallRadius) * sin(item.startAngle - CGFloat.pi / 6))
        let startCenter = CGPoint(x: centerPoint.x + middleRadius * cos(item.startAngle), y: centerPoint.y + middleRadius * sin(item.startAngle))
        let endCenter = CGPoint(x: centerPoint.x + bigRadius * cos(item.startAngle), y: centerPoint.y + bigRadius * sin(item.startAngle))
        let smallBezierPath = UIBezierPath()
//        smallBezierPath.lineCapStyle = .round
//        smallBezierPath.lineJoinStyle = .round
        smallBezierPath.move(to: endCenter)
        smallBezierPath.addQuadCurve(to: startCenter, controlPoint: smallCenter)
        
        let smallShapeLayer = CAShapeLayer()
        smallShapeLayer.frame = self.bounds
        smallShapeLayer.fillColor = UIColor.clear.cgColor
        smallShapeLayer.lineWidth = lineWidth
        smallShapeLayer.lineCap = .round
        smallShapeLayer.strokeColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1).cgColor
        smallShapeLayer.strokeStart = 0
        smallShapeLayer.strokeEnd = 1
        smallShapeLayer.path = smallBezierPath.cgPath
        layer.addSublayer(smallShapeLayer)
        
        

    }
}




struct HeaderCircle {
    // 开始弧度
    var startAngle: CGFloat = 0
    // 结束弧度
    var endAngle: CGFloat = 0
    /// 先从bao开始画图
    var type: RecoommandType = .bao
}

enum RecoommandType {
    case chong
    case wen
    case bao
}

