//
//  SheetTransition.swift
//  YouZhiYuan
//
//  Created by youzy01 on 2019/4/17.
//  Copyright © 2019 泽i. All rights reserved.
//

import UIKit

class SheetTransition: NSObject {
    override init() {}
}

extension SheetTransition: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let controller = SheetPresentationController(presentedViewController: presented, presenting: presenting)
        return controller
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SheetPresentAnimator()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SheetDismissAnimator()
    }

    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
