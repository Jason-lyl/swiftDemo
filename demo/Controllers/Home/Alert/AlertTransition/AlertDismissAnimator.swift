//
//  DismissAnimator.swift
//  Alert
//
//  Created by youzy01 on 2019/4/3.
//  Copyright © 2019 youzy. All rights reserved.
//

import UIKit

/// 消失动画师
class AlertDismissAnimator: NSObject {
}

extension AlertDismissAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else {
            return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(fromView)

        fromView.removeFromSuperview()
        let wasCancelled = transitionContext.transitionWasCancelled
        transitionContext.completeTransition(!wasCancelled)
    }
}

