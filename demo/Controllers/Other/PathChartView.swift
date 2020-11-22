//
//  PathChartView.swift
//  demo
//
//  Created by Jason on 2020/11/21.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

//ss
extension PathChartView {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let size = self.bounds.size
        
        let view = UIView.init(frame: CGRect(x: size.width / 2, y: size.height / 2, width: 4, height: 4))
        view.backgroundColor = UIColor.red
        self.addSubview(view)
        
        context.translateBy (x: size.width / 2, y: size.height / 2)
//        context.scaleBy(x: 1, y: -1)
        
        centreArcPerpendicular(text: "abcd1", context: context, radius: 100, centerAngle: CGFloat.pi / 4, color: UIColor.red, font: UIFont.systemFont(ofSize: 16), clockwise: true)
        
        centreArcPerpendicular(text: "abcd2", context: context, radius: 100, centerAngle: CGFloat.pi / 2, color: UIColor.red, font: UIFont.systemFont(ofSize: 16), clockwise: true)
        
        centreArcPerpendicular(text: "abcd3", context: context, radius: 100, centerAngle: CGFloat.pi, color: UIColor.red, font: UIFont.systemFont(ofSize: 16), clockwise: true)
        
        centreArcPerpendicular(text: "abcd4", context: context, radius: 100, centerAngle: CGFloat.pi * 3 / 2, color: UIColor.red, font: UIFont.systemFont(ofSize: 16), clockwise: true)

        

//        centreArcPerpendicular(text: "Anticlockwise", context: context, radius: 100, centerAngle: -CGFloat.pi / 2, color: UIColor.red, font: UIFont.systemFont(ofSize: 16), clockwise: false)
//        centre(text: "Hello flat world", context: context, radius: 0, angle: 0 , color: UIColor.yellow, font: UIFont.systemFont(ofSize: 16), slantAngle: CGFloat.pi / 4)
    }
}

class PathChartView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white

        
    }
    
    
    
    /// 这将String str围绕半径为r的圆弧绘制，
    /// 文字居中于极角centerAngle
    func centreArcPerpendicular(text: String, context: CGContext, radius: CGFloat, centerAngle: CGFloat, color: UIColor, font: UIFont, clockwise: Bool){
        
        // 单个字符串的数组，字符串中的每个字符
        let characters: [String] = text.map { String($0) }
        let characterCount = characters.count
        let attributes = [NSAttributedString.Key.font: font]
        
        // 这将是每个角色对向的弧线
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
            centre(text: characters[i], context: context, radius: radius, angle: thetaI, color: color, font: font, slantAngle: thetaI + slantCorrection)
            //下一个字符的中心将位于
            // thetaI = thetaI + arcs [i] / 2 + arcs [i + 1] / 2
            //但是我们还是将最后一项保留到下一个循环的开始
            thetaI += direction * arcs[i] / 2
        }
    }
    
    func chordToArc(_ characterWith: CGFloat, radius: CGFloat) -> CGFloat {
        return 2 * asin(characterWith / (2 * radius))
    }
    
    ///
    //这样绘制以居中位置为中心的String str
    //由极坐标（r，theta）指定
    //即x = r * cos（theta）y = r * sin（theta）
    //并旋转角度slantAngle
    func centre(text str: String, context: CGContext, radius: CGFloat, angle: CGFloat, color: UIColor, font: UIFont, slantAngle: CGFloat) {
        
        // Set the text attributes
        let attributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font]
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
        let offsetSize = str.size(withAttributes: attributes)
        // Move the origin by half the size of the text
        context.translateBy (x: -offsetSize.width / 2, y: -offsetSize.height / 2)
        // Move the origin to the centre of the text (negating the y-axis manually)
        // Draw the text
        str.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
        // Restore the context
        context.restoreGState()
    }
    
}
