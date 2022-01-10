//
//  AlertButton.swift
//  demo
//
//  Created by Jason on 2021/10/14.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit

/// 弹窗按钮
public class AlertButton: UIButton {

    private let action: AlertAction
    private var startColor: UIColor = AlertConfiguration.startColor
    private var endColor: UIColor = AlertConfiguration.endColor

    private var startPoint: CGPoint = CGPoint(x: 0, y: 0.5)
    private var endPoint: CGPoint = CGPoint(x: 1, y: 1.5)

    public init(action: AlertAction) {
        self.action = action
        super.init(frame: .zero)
        setUp()
    }

    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }

        guard self.action.style == .default else {
            return
        }

        // 使用rgb颜色空间
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        // 颜色数组（这里使用三组颜色作为渐变
        let compoents: [CGFloat] = [startColor.cgColor, endColor.cgColor].map { $0.components }.compactMap { $0 }.reduce([], +)
        // 没组颜色所在位置（范围0~1)
        let locations: [CGFloat] = [0, 1]
        // 生成渐变色（count参数表示渐变个数）
        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: compoents,
                                  locations: locations, count: locations.count)!
        // 渐变开始位置
        let start = CGPoint(x: rect.width * startPoint.x, y: rect.height * startPoint.y)
        // 渐变结束位置
        let end = CGPoint(x: rect.width * endPoint.x, y: rect.height * endPoint.y)

        // 绘制渐变
        context.drawLinearGradient(gradient, start: start, end: end,
                                   options: .drawsBeforeStartLocation)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AlertButton {
    func setUp() {
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        layer.cornerRadius = 18
        setTitle(action.title, for: .normal)
        addTarget(action, action: #selector(action.tapAction), for: .touchUpInside)

        switch action.style {
        case .cancel:
            layer.borderColor = AlertConfiguration.titleColor.cgColor
            layer.borderWidth = 0.5
            setTitleColor(AlertConfiguration.titleColor, for: .normal)
        case .default:
            layer.masksToBounds = true
            setTitleColor(.white, for: .normal)
            setNeedsDisplay()
        }
    }
}

