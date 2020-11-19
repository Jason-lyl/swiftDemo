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
    private let lineWidth: CGFloat = 24
    /// 最小圆半径
    private let smallRadius: CGFloat = 10
    /// 大圆半径
    private var bigRadius: CGFloat = 0
    /// 中间圆半径
    private var middleRadius: CGFloat = 0
    /// 中心点圆心
    private var centerPoint = CGPoint.zero
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initDataSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initDataSource()
    }
    
    func initDataSource() {
        
        self.backgroundColor = UIColor.white
        bigRadius = (frame.width - leftEdge * 2) / 2
        middleRadius = (frame.width - leftEdge * 2 - lineWidth * 2) / 2
        centerPoint = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        let dataArray: [CGFloat] = [0.3, 0.5, 0.2]
        
        for (index, item) in dataArray.enumerated() {
            
            var model = HeaderCircle()
            switch index {
            case 0:
                model.startAngle =  CGFloat.pi / 20
                model.endAngle = item * CGFloat.pi * 2 + CGFloat.pi / 20
                model.type = .bao
                model.color = #colorLiteral(red: 0.5568627451, green: 0.8666666667, blue: 0.3568627451, alpha: 1)
                model.count = 27
                model.title = "可保底"
            case 1:
                model.startAngle = dataArray[0] * CGFloat.pi * 2 + CGFloat.pi / 20
                model.endAngle = (dataArray[0] + item) * CGFloat.pi * 2 + CGFloat.pi / 20
                model.type = .chong
                model.color = #colorLiteral(red: 0.9137254902, green: 0.1882352941, blue: 0.1764705882, alpha: 1)
                model.title = "需冲刺"
                model.count = 85
                
            case 2:
                model.startAngle = (dataArray[0] + dataArray[1]) * CGFloat.pi * 2 + CGFloat.pi / 20
                model.endAngle = CGFloat.pi * 2 + CGFloat.pi / 20
                model.type = .wen
                model.color = #colorLiteral(red: 0.9960784314, green: 0.7921568627, blue: 0.1607843137, alpha: 1)
                model.count = 32
                model.title = "较稳妥"
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
        
        
        if dataSource.count > 0 {
            drawLayer1(dataSource[0], context: context)
            drawLayer1(dataSource[1], context: context)
            drawLayer1(dataSource[2], context: context)

        }
        
        if dataSource.count > 0 {
            drawLineChart(dataSource[1], context: context)

        }
        

    }
    
    func drawLayer1(_ item: HeaderCircle, context: CGContext) {
        
        context.translateBy(x: centerPoint.x, y: centerPoint.y)

        //重置圆点 设置圆心
        context.saveGState()
        context.rotate(by: item.endAngle - CGFloat.pi / 20)
//        let pointAngle =  -(CGFloat.pi / 20)
//        let pointR = middleRadius + 11
//        let smallCenter = CGPoint(x: centerPoint.x + pointR * cos(pointAngle), y: centerPoint.y + pointR * sin(pointAngle))
        let smallCenter = CGPoint(x: middleRadius + lineWidth / 2 + 1, y: 0)

        switch item.type {
        case .wen:
            context.setStrokeColor(UIColor.white.cgColor)
        case .bao:
            context.setStrokeColor(UIColor.brown.cgColor)
        case .chong:
            context.setStrokeColor(UIColor.black.cgColor)
        }
        context.setStrokeColor(UIColor.white.cgColor)

        context.setLineWidth(4.5)
//        context.setBlendMode(.destinationOut)
        context.addArc(center: smallCenter, radius: lineWidth / 2 + 3.5, startAngle: 0, endAngle: CGFloat.pi, clockwise: false)
        context.drawPath(using: .stroke)
        context.restoreGState()
        
        context.translateBy(x: -centerPoint.x, y: -centerPoint.y)

        
    }
    
    
    func drawLayer(_ item: HeaderCircle, context: CGContext) {
        
        
        context.beginPath()

        context.addArc(center: centerPoint, radius: middleRadius + lineWidth / 2, startAngle: item.startAngle, endAngle: item.endAngle, clockwise: false)

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
        
        
        
        // 绘制文字
        let pointAngle = item.startAngle + (item.endAngle - item.startAngle) / 2
        let pointRdius = middleRadius + lineWidth / 2
        let textCenter = CGPoint(x: centerPoint.x + pointRdius * cos(pointAngle), y: centerPoint.y + pointRdius * sin(pointAngle))
//        let roatedAngle = CGFloat.pi * 2 - (item.endAngle - item.startAngle) / 2
        let roatedAngle = CGFloat.pi + (item.endAngle - item.startAngle) / 2 - item.endAngle / 2

        context.translateBy(x: textCenter.x, y: textCenter.y)
        context.saveGState()
        context.rotate(by: roatedAngle)
        let string = item.title as NSString
        let style = NSMutableParagraphStyle.init()
        style.alignment = .center
        
        let attributedArr = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.paragraphStyle: style]
        let width = string.boundingRect(with: CGSize(width: 200, height: 15), options: .usesLineFragmentOrigin, attributes: attributedArr, context: nil).size.width
//        let rect = CGRect(x: textCenter.x - (width / 2), y: textCenter.y - 8, width: width, height: 15)
        let rect = CGRect(x: -(width / 2), y: -8, width: width, height: 15)

        
        string.draw(in: rect, withAttributes: attributedArr)
        context.restoreGState()
        
        context.translateBy(x: -textCenter.x, y: -textCenter.y)

    



        
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
    
    /// 绘画折线图和描述
    func drawLineChart(_ item: HeaderCircle, context: CGContext) {
        
        context.beginPath()
        context.resetClip()
        let centerAngle = item.startAngle + (item.endAngle - item.startAngle) / 2
        let area = getLocationArea(centerAngle)
        
        let pointRadius = bigRadius + 5
        
        let startPoint = CGPoint(x: centerPoint.x + pointRadius * cos(centerAngle), y: centerPoint.y + pointRadius * sin(centerAngle))
        let middlePoint = CGPoint(x: startPoint.x - lineWidth, y: startPoint.y - lineWidth)
        let endPoint = CGPoint(x: middlePoint.x - lineWidth - lineWidth, y: middlePoint.y)
        
        context.move(to: startPoint)
        context.addLine(to: middlePoint)
        context.addLine(to: endPoint)
        context.setLineWidth(1)
        context.setLineDash(phase: 0, lengths: [1, 1])
        context.setStrokeColor(UIColor.red.cgColor)
        context.drawPath(using: .stroke)
        
            
        
        
    }
    
    
        
    /// 获取折线图画图区域
    /// - Parameter angle: 当前弧度中心点度数
    /// - Returns: 所处区域
    func getLocationArea(_ angle: CGFloat) -> EngineHeaderArea {
        
        if angle > 0 && angle < CGFloat.pi / 2 {
            return .bottomRight
        } else if angle >= CGFloat.pi / 2 && angle < CGFloat.pi {
            return .bottomLeft
        } else if angle >= CGFloat.pi && angle <= CGFloat.pi * 3 / 2 {
            return .topLeft
        } else {
            return .topRight
        }
        
    }
    
    
}

/// 智能引擎判断折线区域
enum EngineHeaderArea {
    
    //左上
    case topLeft
    // 右上
    case topRight
    // 左下
    case bottomLeft
    // 右下
    case bottomRight
    
}


/// 引擎头部数据模型
struct HeaderCircle {
    // 开始弧度
    var startAngle: CGFloat = 0
    // 结束弧度
    var endAngle: CGFloat = 0
    // 先从bao开始画图
    var type: RecoommandType = .bao
    //标题
    var title: String = ""
    //数量
    var count: Int = 0
    // 颜色
    var color: UIColor = .white
}

enum RecoommandType {
    case chong
    case wen
    case bao
}
