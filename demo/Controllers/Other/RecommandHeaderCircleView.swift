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
    
    override func draw(_ rect: CGRect) {
        addCircleWithProgress()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
    }


    func addCircleWithProgress() {
        
        let dataArray: [CGFloat] = [0.3, 0.5, 0.2]
        
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
        
        for item in dataSource {
            drawLayer2(item)
        }
        
        
    }
    
    func drawLayer(_ item: HeaderCircle) {
        
        let centerPoint = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        let bezierPath = UIBezierPath(arcCenter: centerPoint, radius: middleRadius + 10, startAngle: item.startAngle, endAngle: item.endAngle, clockwise: true)
        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.frame = self.bounds
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineWidth = lineWidth
//        shapeLayer.lineCap = .round
//        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0.4588235294, blue: 0.4509803922, alpha: 1).cgColor
//        shapeLayer.strokeStart = 0
//        shapeLayer.strokeEnd = 1
//        shapeLayer.path = bezierPath.cgPath
//        layer.addSublayer(shapeLayer)
        bezierPath.lineWidth = lineWidth
        switch item.type {
        case .bao:
            #colorLiteral(red: 0.5568627451, green: 0.8666666667, blue: 0.3568627451, alpha: 1).setStroke()
        case .chong:
            #colorLiteral(red: 0.9137254902, green: 0.1882352941, blue: 0.1764705882, alpha: 1).setStroke()
        case .wen:
            #colorLiteral(red: 0.9960784314, green: 0.7921568627, blue: 0.1607843137, alpha: 1).setStroke()
        }
        bezierPath.stroke()
        




        
        
        
        

        
//        let smallShapeLayer = CAShapeLayer()
//        smallShapeLayer.frame = self.bounds
//        smallShapeLayer.fillColor = UIColor.clear.cgColor
//        smallShapeLayer.lineWidth = lineWidth
//        smallShapeLayer.lineCap = .round
//        smallShapeLayer.strokeColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1).cgColor
//        smallShapeLayer.strokeStart = 0
//        smallShapeLayer.strokeEnd = 1
//        smallShapeLayer.path = smallBezierPath.cgPath
//        layer.addSublayer(smallShapeLayer)
        
        

    }
    
    func drawLayer2(_ item: HeaderCircle) {
        let centerPoint = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)

        let smallCenter = CGPoint(x: centerPoint.x + (middleRadius + 13) * cos(item.startAngle + CGFloat.pi / 25), y: centerPoint.y + (middleRadius +  13) * sin(item.startAngle + CGFloat.pi / 25))
        
        let startCenter = CGPoint(x: centerPoint.x + (middleRadius - 10) * cos(item.startAngle - CGFloat.pi / 15), y: centerPoint.y + (middleRadius - 10) * sin(item.startAngle - CGFloat.pi / 15))
        let endCenter = CGPoint(x: centerPoint.x + (bigRadius + 10) * cos(item.startAngle - CGFloat.pi / 15), y: centerPoint.y + (bigRadius + 10) * sin(item.startAngle - CGFloat.pi / 15))
        
        #warning("测试")

//        let smallView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 10, height: 10)))
//        smallView.center = smallCenter
//        smallView.layer.cornerRadius = 5
//        smallView.backgroundColor = UIColor.brown
//        self.addSubview(smallView)
//
//        let smallView1 = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 10, height: 10)))
//        smallView1.layer.cornerRadius = 5
//        smallView1.center = startCenter
//        smallView1.backgroundColor = UIColor.gray
//        self.addSubview(smallView1)
//
//
//        let smallView2 = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 10, height: 10)))
//        smallView2.center = endCenter
//        smallView2.layer.cornerRadius = 5
//        smallView2.backgroundColor = UIColor.green
//        self.addSubview(smallView2)
        
        let smallBezierPath = UIBezierPath()
        smallBezierPath.move(to: startCenter)
        smallBezierPath.addQuadCurve(to: endCenter, controlPoint: smallCenter)
        smallBezierPath.lineWidth = 5
//        UIColor.white.setFill()
        UIColor.white.setStroke()
        smallBezierPath.stroke()
//        smallBezierPath.fill()

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

