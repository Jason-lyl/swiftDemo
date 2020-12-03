//
//  PresentAmator.swift
//  demo
//
//  Created by Jason on 2020/12/1.
//  Copyright © 2020 youzy. All rights reserved.
//

import Foundation
import UIKit

//
//  PresentAnimator.swift
//  YouZhiYuan
//
//  Created by 泽i on 2018/10/8.
//  Copyright © 2018年 泽i. All rights reserved.
//

/// 弹出动画师
class PresentAnimator: NSObject {
    var transitionStyle: TransitionStyle
    var selectedView: UIView?

    init(style: TransitionStyle, selectedView: UIView?) {
        self.selectedView = selectedView
        self.transitionStyle = style
    }
}

extension PresentAnimator: UIViewControllerAnimatedTransitioning {

    ///控制转场动画执行时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    /// 过渡动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        
//        guard let selecteView = selectedView else {
//            return
//        }

        let containerView = transitionContext.containerView
        containerView.addSubview(toView)

        setup(toView)

        animate(toView, context: transitionContext)
    }
}

extension PresentAnimator {

    func animate(_ toView: UIView, context: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: context)
        UIView.animate(withDuration: duration, animations: {
            toView.transform = CGAffineTransform.identity
            if self.transitionStyle == .fade {
                toView.alpha = 1
            }
        }) { (isFinish) in
            if isFinish {
                let wasCancelled = context.transitionWasCancelled
                context.completeTransition(!wasCancelled)
            }
        }
    }

    func setup(_ toView: UIView) {
        switch transitionStyle {
        case .alert:
            toView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        case .sheet:
            toView.transform = CGAffineTransform(translationX: 0, y: toView.frame.maxY)
        case .push:
            toView.transform = CGAffineTransform(translationX: toView.frame.maxX, y: 0)
        case .pop:
            toView.transform = CGAffineTransform(translationX: -toView.frame.maxX, y: 0)
        case .drop:
            toView.transform = CGAffineTransform(translationX: 0, y: -toView.frame.maxY)
        case .fade:
            toView.alpha = 0
        }
    }
}
