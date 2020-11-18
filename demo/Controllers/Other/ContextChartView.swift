//
//  ContextChartView.swift
//  demo
//
//  Created by Jason on 2020/11/18.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class ContextChartView: UIView {
    
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
        initDataSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
    }
    
    func initDataSource() {
        
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
    
    }

}

extension ContextChartView {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
       
        for item in dataSource {
            drawLayer(item, context: context)

        }
//        if dataSource.count > 0 {
//            drawLayer(dataSource[0], context: context)
//
//        }


    }
    
    
    func drawLayer(_ item: HeaderCircle, context: CGContext) {
        
        
        context.beginPath()
        let centerPoint = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        context.addArc(center: centerPoint, radius: middleRadius + 10, startAngle: item.startAngle, endAngle: item.endAngle, clockwise: false)
        
        switch item.type {
        case .bao:
            context.setStrokeColor(#colorLiteral(red: 0.5568627451, green: 0.8666666667, blue: 0.3568627451, alpha: 1).cgColor)
        case .chong:
            context.setStrokeColor(#colorLiteral(red: 0.9137254902, green: 0.1882352941, blue: 0.1764705882, alpha: 1).cgColor)
        case .wen:
            context.setStrokeColor(#colorLiteral(red: 0.9960784314, green: 0.7921568627, blue: 0.1607843137, alpha: 1).cgColor)
        }

        context.setLineWidth(lineWidth)
        context.drawPath(using: .stroke)
        
        
        let pointAngle = item.startAngle + CGFloat.pi / 20
        let pointR = middleRadius + 16
        let smallCenter = CGPoint(x: centerPoint.x + pointR * cos(pointAngle), y: centerPoint.y + pointR * sin(pointAngle))
        
        let startAngle = item.startAngle - CGFloat.pi / 25
        let startR = middleRadius - 10
        let startCenter = CGPoint(x: centerPoint.x + startR * cos(startAngle), y: centerPoint.y + startR * sin(startAngle))
        
        let endAngle = item.startAngle - CGFloat.pi / 25
        let endR = bigRadius + 10
        let endCenter = CGPoint(x: centerPoint.x + endR * cos(endAngle), y: centerPoint.y + endR * sin(endAngle))
        
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(6)
        context.move(to: startCenter)
        context.setBlendMode(.copy)
        context.addQuadCurve(to: endCenter, control: smallCenter)
        context.drawPath(using: .stroke)
        
        
        
        
        
        
        
        
        
        
        

        
//        //使用rgb颜色空间
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let colors: [CGColor] = [#colorLiteral(red: 0.4588235294, green: 0.4823529412, blue: 1, alpha: 1), #colorLiteral(red: 0.3176470588, green: 0.1098039216, blue: 0.7058823529, alpha: 1)].map { $0.cgColor }
//        let compoents: [CGFloat] = colors.map { $0.components }.compactMap { $0 }.reduce([], +)
//        let locations: [CGFloat] = [0, 1]
//        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: compoents,
//                                  locations: locations, count: locations.count)!
//        //渐变开始位置
//        let start = CGPoint(x: 0, y: 0)
//        //渐变结束位置
//        let end = CGPoint(x: bezierPath.bounds.width, y: bezierPath.bounds.height)
//        //绘制渐变
//        context.drawLinearGradient(gradient, start: start, end: end,
//                                   options: .drawsBeforeStartLocation)

    
    }
    
    
}
