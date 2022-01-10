//
//  AlertTransition.swift
//  Alert
//
//  Created by youzy01 on 2019/4/3.
//  Copyright © 2019 youzy. All rights reserved.
//

import UIKit

class AlertTransition: NSObject {
    override init() {}
}

extension AlertTransition: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let controller = AlertPresentationController(presentedViewController: presented, presenting: presenting)
        return controller
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertPresentAnimator()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertDismissAnimator()
    }

    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return UIPercentDrivenInteractiveTransition()
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return UIPercentDrivenInteractiveTransition()
    }
}
