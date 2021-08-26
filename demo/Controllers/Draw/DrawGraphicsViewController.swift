//
//  DrawGraphicsViewController.swift
//  demo
//
//  Created by Jason on 2021/8/19.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit

///  UIKit 库中所有 UI 组件其实都是由 CoreGraphics 绘制实现的。所以使用 Core Graphics 可以实现比 UIKit 更底层的功能。
/*
 （1）获取绘图上下文
 （2）创建并设置路径
 （3）将路径添加到上下文
 （4）设置上下文状态（如笔触颜色、宽度、填充色等等）
 （5）绘制路径
 */
class DrawGraphicsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let firstView = DrawView1(frame: CGRect(x: 10, y: 100, width: 300, height: 100))
        view.addSubview(firstView)

        let secondView = DrawView2(frame: CGRect(x: 10, y: 200, width: 300, height: 100))
        view.addSubview(secondView)

        let thirdView = CircleView(frame: CGRect(x: 100, y: 300, width: 300, height: 100))
        view.addSubview(thirdView)
    }
}

/// 矩形
fileprivate class DrawView1: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let drawRect = bounds.insetBy(dx: 10, dy: 10)
        // 创建路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x: drawRect.minX, y: drawRect.minY))
        path.addLine(to: CGPoint(x: drawRect.maxX, y: drawRect.minY))
        path.addLine(to: CGPoint(x: drawRect.maxX, y: drawRect.maxY))
        path.addLine(to: CGPoint(x: drawRect.minX, y: drawRect.maxY))
        /// 添加路径到图形上下文
        context.addPath(path)
        /// 设置画笔颜色
        context.setStrokeColor(UIColor.red.cgColor)
        /// 设置画笔宽度
        context.setLineWidth(5)
        /// 设置端点样式
        /*
         .butte: 不绘制端点，线条结尾处直接结束
         .round: 绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆
         .square: 线条结尾处绘制半个边长为线条宽度的正方形。这种形状的端点与“butt”形状的端点十分相似，只是线条略长一点而已。
         */
        context.setLineCap(.round)
        /// 设置连接点样式
        /*
         .mitre：锐角斜切（默认值）
         .round：圆头
         .bevel：平头斜切
         */
        context.setLineJoin(.round)
        /// 设置阴影
        context.setShadow(offset: CGSize(width: 3, height: 3), blur: 1, color: UIColor.gray.cgColor)
        // 绘制路径
        context.strokePath()
    }
}

/// 虚线
fileprivate class DrawView2: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let drawRect = bounds.insetBy(dx: 10, dy: 10)
        // 创建路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x: drawRect.minX, y: drawRect.minY))
        path.addLine(to: CGPoint(x: drawRect.maxX, y: drawRect.minY))
        path.addLine(to: CGPoint(x: drawRect.maxX, y: drawRect.maxY))
        path.addLine(to: CGPoint(x: drawRect.minX, y: drawRect.maxY))
        /// 添加路径到图形上下文
        context.addPath(path)
        /// 设置画笔颜色
        context.setStrokeColor(UIColor.brown.cgColor)
        /// 设置画笔宽度
        context.setLineWidth(5)

        /// 设置虚线长度和间隔
        /// 设置虚线时 端点和连接方式需要默认，否则虚线无效
        context.setLineDash(phase: 0, lengths: [10, 2])
        // 绘制路径
        context.strokePath()
    }
}

/// 虚
fileprivate class CircleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let drawRect = bounds.insetBy(dx: 10, dy: 10)
        // 创建路径
        let path = CGMutablePath()
        let radius = min(drawRect.width, drawRect.height) / 2
        path.addArc(center: CGPoint(x: drawRect.midX, y: drawRect.midY), radius: radius, startAngle: .pi / 4, endAngle: 1.5 * .pi, clockwise: false)
        /// 添加路径到图形上下文
        context.addPath(path)
        /// 设置画笔颜色
        context.setStrokeColor(UIColor.green.cgColor)
        /// 设置画笔宽度
        context.setLineWidth(5)
        // 绘制路径
        context.strokePath()
    }
}
