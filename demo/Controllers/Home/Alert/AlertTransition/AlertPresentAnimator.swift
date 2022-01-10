//
//  PresentAnimator.swift
//  Alert
//
//  Created by youzy01 on 2019/4/3.
//  Copyright © 2019 youzy. All rights reserved.
//

import UIKit

/// 弹出动画师
class AlertPresentAnimator: NSObject {
}

extension AlertPresentAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        let wasCancelled = transitionContext.transitionWasCancelled
        transitionContext.completeTransition(!wasCancelled)
    }
}
