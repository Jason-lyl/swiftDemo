//
//  DismissAnimator.swift
//  YouZhiYuan
//
//  Created by 泽i on 2018/10/8.
//  Copyright © 2018年 泽i. All rights reserved.
//

/// 消失动画师
class DismissAnimator: NSObject {

    var transitionStyle: TransitionStyle

    init(style: TransitionStyle) {
        self.transitionStyle = style
    }
}

import UIKit


extension DismissAnimator: UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else {
            return
        }

        let containerView = transitionContext.containerView

        containerView.addSubview(fromView)

        animate(fromView, context: transitionContext)
    }
}

extension DismissAnimator {

    func animate(_ fromView: UIView, context: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: context)
        let transform = transForm(fromView: fromView)
        UIView.animate(withDuration: duration, animations: {
            let transform1 = CGAffineTransform(scaleX: 0.2, y: 0.2)
//            transform1.rotated(by: CGFloat.pi)
            fromView.transform = transform1
            if self.transitionStyle == .fade {
                fromView.alpha = 0
            }
        }) { (isFinish) in
            if isFinish {
                fromView.removeFromSuperview()
                let wasCancelled = context.transitionWasCancelled
                context.completeTransition(!wasCancelled)
            }
        }
    }

    func transForm(fromView: UIView) -> CGAffineTransform {
        switch transitionStyle {
        case .alert:
//            return CGAffineTransform(scaleX: 0.001, y: 0.001)
            return CGAffineTransform(translationX: 100, y: 300)

        case .sheet:
            return CGAffineTransform(translationX: 0, y: fromView.frame.maxY)
        case .push:
            return CGAffineTransform(translationX: fromView.frame.maxX, y: 0)
        case .pop:
            return CGAffineTransform(translationX: -fromView.frame.maxX, y: 0)
        case .drop:
            return CGAffineTransform(translationX: 0, y: -fromView.frame.maxY)
        case .fade:
            return CGAffineTransform.identity
        }
    }
}


/// 转场动画类型枚举
enum TransitionStyle {
    case alert
    case sheet
    case push
    case pop
    case drop
    case fade // 淡入淡出
}

/// 弹出视图对齐方式枚举
enum Alignment {
    case left
    case top
    case right
    case bottom
    case center

    case bottomAuto
}

