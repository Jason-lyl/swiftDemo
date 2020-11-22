//
//  ContextChartView.swift
//  demo
//
//  Created by Jason on 2020/11/18.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit


/// x1 = x0 + r * cos(angle * PI / 180)
/// y1 = y0 + r * sin(angle * PI /180)

class ContextChartView: UIView {
    
    /// 数据源
    var dataSource: [HeaderCircle] = []
    
    private let leftEdge: CGFloat = 100
    
    ///扩展长度
    private let extentLine: CGFloat = 6

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
                model.startAngle = 0
                model.endAngle = item * CGFloat.pi * 2
                model.type = .bao
                model.color = #colorLiteral(red: 0.5568627451, green: 0.8666666667, blue: 0.3568627451, alpha: 1)
                model.count = 32
                model.title = "可保底"
                model.starColor = #colorLiteral(red: 0.5568627451, green: 0.8705882353, blue: 0.3568627451, alpha: 1)
                model.endColor = #colorLiteral(red: 0.4784313725, green: 0.862745098, blue: 0.231372549, alpha: 1)
            case 1:
                model.startAngle = dataArray[0] * CGFloat.pi * 2
                model.endAngle = (dataArray[0] + item) * CGFloat.pi * 2
                model.type = .chong
                model.color = #colorLiteral(red: 0.9137254902, green: 0.1882352941, blue: 0.1764705882, alpha: 1)
                model.title = "需冲刺"
                model.count = 85
                model.starColor = #colorLiteral(red: 1, green: 0.3137254902, blue: 0.3254901961, alpha: 1)
                model.endColor = #colorLiteral(red: 0.9137254902, green: 0.1882352941, blue: 0.1764705882, alpha: 1)

                
            case 2:
                model.startAngle = (dataArray[0] + dataArray[1]) * CGFloat.pi * 2
                model.endAngle = CGFloat.pi * 2
                model.type = .wen
                model.color = #colorLiteral(red: 0.9960784314, green: 0.7921568627, blue: 0.1607843137, alpha: 1)
                model.count = 27
                model.title = "较稳妥"
                model.starColor = #colorLiteral(red: 0.9960784314, green: 0.7921568627, blue: 0.1607843137, alpha: 1)
                model.endColor = #colorLiteral(red: 0.9960784314, green: 0.6784313725, blue: 0.168627451, alpha: 1)
            default:
                break
            }
            model.startAngle += CGFloat.pi / 6
            model.endAngle += CGFloat.pi / 6
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
        
        for item in dataSource {
            drawWhiteHalfcircle(item, context: context)

        }
    
        for item in dataSource {
            drawLineChart(item, context: context)

        }
        
        drawTotalCountTitle()

    }
    
    func drawWhiteHalfcircle(_ item: HeaderCircle, context: CGContext) {
        
        context.translateBy(x: centerPoint.x, y: centerPoint.y)

        //重置圆点 设置圆心
        context.saveGState()
        context.rotate(by: item.endAngle + CGFloat.pi / 120)
//        let pointAngle =  -(CGFloat.pi / 20)
//        let pointR = middleRadius + 11
//        let smallCenter = CGPoint(x: centerPoint.x + pointR * cos(pointAngle), y: centerPoint.y + pointR * sin(pointAngle))
        
        let smallY = (middleRadius + lineWidth / 2) * tan(CGFloat.pi / 16)
        let smallCenter = CGPoint(x: middleRadius + lineWidth / 2 - 1, y: -smallY)


        switch item.type {
        case .wen:
            context.setStrokeColor(UIColor.white.cgColor)
        case .bao:
            context.setStrokeColor(UIColor.brown.cgColor)
        case .chong:
            context.setStrokeColor(UIColor.black.cgColor)
        }
        context.setStrokeColor(UIColor.white.cgColor)

        context.setLineWidth(4)
//        context.setBlendMode(.destinationOut)
        context.addArc(center: smallCenter, radius: smallY, startAngle: 0, endAngle: CGFloat.pi, clockwise: false)
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
//        context.drawPath(using: .stroke)
        
        //使用rgb颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors: [CGColor] = [item.starColor, item.endColor].map { $0.cgColor }
        let compoents: [CGFloat] = colors.map { $0.components }.compactMap { $0 }.reduce([], +)
        let locations: [CGFloat] = [0, 1]
        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: compoents,
                                  locations: locations, count: locations.count)!
        //渐变开始位置
        let startCenter = CGPoint(x: centerPoint.x + bigRadius * cos(item.startAngle), y: centerPoint.y + bigRadius * sin(item.startAngle))
        
        let endCenter = CGPoint(x: centerPoint.x + bigRadius * cos(item.endAngle), y: centerPoint.y + bigRadius * sin(item.endAngle))
        
        context.replacePathWithStrokedPath()
        context.clip()
        
        //绘制渐变
        context.drawLinearGradient(gradient, start: startCenter, end: endCenter,
                                   options: .drawsBeforeStartLocation)
        context.resetClip()

        
        
        
        
        
        // 绘制文字
        
        let centerAngle = CGFloat.pi * 2 - item.endAngle + (item.endAngle - item.startAngle) / 2
        
        drawObliqueText(text: item.title, context: context, radius: middleRadius + lineWidth / 2, centerAngle: centerAngle, clockwise: true)
    

    
    }
    
    
    /// 获取文字旋转弧度
    /// - Parameter item: 参数模型
    /// - Returns: 弧度
    func getRotateAngle(_ item: HeaderCircle) -> CGFloat {
        
        // 终点弧度所在区域
        let endArea = getLocationArea(item.endAngle)
        // 中线所在区域
        let centerArea = getLocationArea(item.startAngle + (item.endAngle - item.startAngle) / 2)
        
        var ratateAngle: CGFloat = 0
        if endArea == .bottomRight && endArea == .bottomRight {
            ratateAngle = CGFloat.pi - (item.startAngle + item.endAngle) / 2
        } else if endArea == .bottomLeft && centerArea == .bottomRight {
            ratateAngle = (item.endAngle - item.startAngle + CGFloat.pi) / 2
        } else if endArea == .topLeft && centerArea == .topLeft {
            ratateAngle = CGFloat.pi * 2 - 3 * item.endAngle / 2 + item.startAngle / 2
        } else if endArea == .topRight && centerArea == .topLeft {
            ratateAngle = (item.endAngle + item.startAngle) / 2 - CGFloat.pi / 2
        } else {
            ratateAngle = (item.endAngle + item.startAngle) / 2 - 3 * CGFloat.pi / 2
        }
        return ratateAngle

        
        
    }
    
}

// MARK: - 绘画折线图和描述
extension ContextChartView {
    /// 绘画折线图和描述
    func drawLineChart(_ item: HeaderCircle, context: CGContext) {
        
        context.beginPath()
        context.resetClip()
        let centerAngle = item.startAngle + (item.endAngle - item.startAngle) / 2
        let pointRadius = bigRadius + 5
        let startPoint = CGPoint(x: centerPoint.x + pointRadius * cos(centerAngle), y: centerPoint.y + pointRadius * sin(centerAngle))

        var middlePoint = CGPoint.zero
        var endPoint = CGPoint.zero
        
        
        let area = getLocationArea(centerAngle)
        
        switch area {
        case .topLeft:
            middlePoint = CGPoint(x: startPoint.x - lineWidth, y: startPoint.y - lineWidth)
            endPoint = CGPoint(x: middlePoint.x - lineWidth * 2 - extentLine, y: middlePoint.y)
        case .bottomLeft:
            middlePoint = CGPoint(x: startPoint.x - lineWidth, y: startPoint.y + lineWidth)
            endPoint = CGPoint(x: middlePoint.x - lineWidth * 2 - extentLine, y: middlePoint.y)
        case . topRight:
            middlePoint = CGPoint(x: startPoint.x + lineWidth, y: startPoint.y - lineWidth)
            endPoint = CGPoint(x: middlePoint.x + lineWidth * 2 + extentLine, y: middlePoint.y)
        case .bottomRight:
            middlePoint = CGPoint(x: startPoint.x + lineWidth, y: startPoint.y + lineWidth)
            endPoint = CGPoint(x: middlePoint.x + lineWidth * 2 + extentLine, y: middlePoint.y)
        }
        
        
        context.move(to: startPoint)
        context.addLine(to: middlePoint)
        context.addLine(to: endPoint)
        context.setLineWidth(1)
        context.setLineDash(phase: 0, lengths: [1, 1])
        context.setStrokeColor(item.color.cgColor)
        context.drawPath(using: .stroke)
        
        // title
        let string = item.title as NSString
        let style = NSMutableParagraphStyle.init()
        style.alignment = .center
        
        let attributedArr: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1),
            NSAttributedString.Key.paragraphStyle: style
        ]
        let width = string.boundingRect(with: CGSize(width: 200, height: 14), options: .usesLineFragmentOrigin, attributes: attributedArr, context: nil).size.width
        
        var titlePoint = CGPoint.zero
        
        // 数量
        let countAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22),
            NSAttributedString.Key.foregroundColor: item.color
        ]
        
        let suoAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1),
        ]
        let countAttributedString = NSMutableAttributedString.init(string: "\(item.count) 所", attributes: countAttributes)
        let range: NSRange = (countAttributedString.string as NSString).range(of: " 所")
        countAttributedString.addAttributes(suoAttributes, range: range)
        
        let countWith = countAttributedString.boundingRect(with: CGSize(width: 200, height: 24), options: .usesLineFragmentOrigin, context: nil).size.width

        
        var countPoint = CGPoint.zero
        
        switch area {
        case .topLeft:
            titlePoint = CGPoint(x: middlePoint.x - width - 10, y: middlePoint.y - 20)
            countPoint = CGPoint(x: middlePoint.x - countWith - 5, y: titlePoint.y - 26)
        case .topRight:
            titlePoint = CGPoint(x: middlePoint.x + 10, y: middlePoint.y - 20)
            countPoint = CGPoint(x: middlePoint.x + 10, y: titlePoint.y - 26)
        case .bottomLeft:
            titlePoint = CGPoint(x: middlePoint.x - width - 10, y: middlePoint.y - 20)
            countPoint = CGPoint(x: middlePoint.x - countWith - 5, y: titlePoint.y - 26)

        case .bottomRight:
            titlePoint = CGPoint(x: middlePoint.x + 10, y: middlePoint.y - 20)
            countPoint = CGPoint(x: middlePoint.x + 10, y: titlePoint.y - 26)

        }
                
        let rect = CGRect(origin: titlePoint, size: CGSize(width: width, height: 14))
        string.draw(in: rect, withAttributes: attributedArr)
        
        let countRect = CGRect(origin: countPoint, size: CGSize(width: countWith, height: 24))
        countAttributedString.draw(in: countRect)
        
        

        
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

// MARK: - 画总共院校内容
extension ContextChartView {
    
    func drawTotalCountTitle() {
        
        let total = dataSource.map({$0.count}).reduce(0, +)
        
        let totalAttributeds: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        let suoAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1),
        ]
        
        // 总数量
        let totalAttributedString = NSMutableAttributedString.init(string: "\(total) 所", attributes: totalAttributeds)
        let range: NSRange = (totalAttributedString.string as NSString).range(of: " 所")
        totalAttributedString.addAttributes(suoAttributes, range: range)
        
        let totalSize = totalAttributedString.boundingRect(with: CGSize(width: 200, height: 35), options: .usesLineFragmentOrigin, context: nil).size
        let totalPoint = CGPoint(x: centerPoint.x - totalSize.width / 2, y: centerPoint.y - totalSize.height / 2 - 10)
        totalAttributedString.draw(in: CGRect(origin: totalPoint, size: totalSize))
        
        //描述
        let describAttributedString = NSMutableAttributedString.init(string: "适合我的大学", attributes: suoAttributes)
        
        let describSize = describAttributedString.boundingRect(with: CGSize(width: 200, height: 14), options: .usesLineFragmentOrigin, context: nil).size
        let describPoint = CGPoint(x: centerPoint.x - describSize.width / 2, y: centerPoint.y + totalSize.height / 2 - 10)
        describAttributedString.draw(in: CGRect(origin: describPoint, size: describSize))
        

    }
    
    
}


// MARK: - 绘制文字倾斜度方法
extension ContextChartView {
    
    /// 这将String str围绕半径为r的圆弧绘制，
    /// 文字居中于极角centerAngle
    func drawObliqueText(text: String, context: CGContext, radius: CGFloat, centerAngle: CGFloat, clockwise: Bool){
        
        context.translateBy (x: centerPoint.x, y: centerPoint.y)

        // 单个字符串的数组，字符串中的每个字符
        let characters: [String] = text.map { String($0) }
        let characterCount = characters.count
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)]
        
        // 这将是每个字符对向的弧线
        var arcs: [CGFloat] = []
        // 以及字符串所包含的总弧线
        var totalArc: CGFloat = 0
        
        // 计算每个字母和它们的总数所对应的弧
        for i in 0 ..< characterCount {
            arcs += [chordToArc(characters[i].size(withAttributes: attributes).width, radius: radius)]
            totalArc += arcs[i]
        }
        
        // 我们是按顺时针方向书写吗（在12点钟朝上，在6点钟朝上颠倒）
        // 还是逆时针（6点钟向右）？
        let direction: CGFloat = clockwise ? -1 : 1
        let slantCorrection: CGFloat = clockwise ? -.pi / 2 : .pi / 2
        
        //第一个字符的中心将位于
        // thetaI = theta-totalArc / 2 + arcs [0] / 2
        //但是我们在循环中添加了最后一项
        var thetaI = centerAngle - direction * totalArc / 2
        
        for i in 0 ..< characterCount {
            thetaI += direction * arcs[i] / 2
            //依次调用centerText和每个字符。
            //记得在slantAngle上加上+/-90º
            //角色将“堆叠”成圆弧，而不是“文字流”
            draw(character: characters[i], context: context, radius: radius, angle: thetaI, slantAngle: thetaI + slantCorrection)
            //下一个字符的中心将位于
            // thetaI = thetaI + arcs [i] / 2 + arcs [i + 1] / 2
            //但是我们还是将最后一项保留到下一个循环的开始
            thetaI += direction * arcs[i] / 2
        }
        
        context.translateBy (x: -centerPoint.x, y: -centerPoint.y)

    }
    
    ///反正弦函数：asin(1/2) = 30°
    /// 正弦函数： sin(30°) = 0.5
    func chordToArc(_ characterWith: CGFloat, radius: CGFloat) -> CGFloat {
        return 2 * asin(characterWith / (2 * radius))
    }
    
    ///这样绘制以居中位置为中心的String str
    ///由极坐标（r，theta）指定
    ///即x = r * cos（theta）y = r * sin（theta）
    ///并旋转角度slantAngle
    func draw(character: String, context: CGContext, radius: CGFloat, angle: CGFloat, slantAngle: CGFloat) {
        
        // Set the text attributes
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)]
        //let attributes = [NSForegroundColorAttributeName: c, NSFontAttributeName: font]
        // Save the context
        context.saveGState()
        // 撤消Y轴的反转（否则文本会倒退！）
//        context.scaleBy(x: 1, y: -1)
        // 将原点移动到文本的中心（手动使y轴反向）
        context.translateBy(x: radius * cos(angle), y: -(radius * sin(angle)))
        // Rotate the coordinate system
        context.rotate(by: -slantAngle)
        // 计算文字的宽度
        let offsetSize = character.size(withAttributes: attributes)
        // Move the origin by half the size of the text
        context.translateBy (x: -offsetSize.width / 2, y: -offsetSize.height / 2)
        // Move the origin to the centre of the text (negating the y-axis manually)
        // Draw the text
        character.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
        // Restore the context
        context.restoreGState()
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
    // 渐变起始颜色
    var starColor: UIColor = .white
    // 渐变结束颜色
    var endColor: UIColor = .white
}

enum RecoommandType {
    case chong
    case wen
    case bao
}
