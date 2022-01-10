//
//  SheetDismissAnimator.swift
//  YouZhiYuan
//
//  Created by youzy01 on 2019/4/17.
//  Copyright © 2019 泽i. All rights reserved.
//

import UIKit

class SheetDismissAnimator: NSObject {
}

extension SheetDismissAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else {
            return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(fromView)

        let duration = transitionDuration(using: transitionContext)
        let transform = CGAffineTransform(translationX: 0, y: fromView.frame.maxY)
        UIView.animate(withDuration: duration, animations: {
            fromView.transform = transform
            print("消失动画")
        }) { (isFinish) in
            if isFinish {
                print("消失动画完成")
                fromView.removeFromSuperview()
            }
            let wasCancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!wasCancelled)
        }
    }
}
