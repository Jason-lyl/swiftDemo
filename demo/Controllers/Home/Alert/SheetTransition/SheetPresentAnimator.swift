//
//  SheetPresentAnimator.swift
//  YouZhiYuan
//
//  Created by youzy01 on 2019/4/17.
//  Copyright © 2019 泽i. All rights reserved.
//

import UIKit

class SheetPresentAnimator: NSObject {
}

extension SheetPresentAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform(translationX: 0, y: toView.frame.maxY)

        animate(toView, context: transitionContext)
    }

    func animate(_ toView: UIView, context: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(using: context)

        UIView.animate(withDuration: duration, animations: {
            toView.transform = CGAffineTransform.identity
        }) { (_) in
            let wasCancelled = context.transitionWasCancelled
            context.completeTransition(!wasCancelled)
        }
    }
}
