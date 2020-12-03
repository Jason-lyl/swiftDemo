//
//  TransitionManager.swift
//  YouZhiYuan
//
//  Created by 泽i on 2018/10/8.
//  Copyright © 2018年 泽i. All rights reserved.
//

import UIKit

/// 转场动画管理类
class TransitionManager: NSObject {
    /// 弹出视图的对齐方式，默认 左对齐
    var alignment: Alignment = .left
    /// 弹出视图的尺寸缩放比例，默认原始大小
    var sizeRatio: SizeRatio = SizeRatio.max
    /// 转场动画类型，默认sheet从下往上
    var transitionStyle: TransitionStyle = .sheet
    var presentTransition = UIPercentDrivenInteractiveTransition()
    var dismissTransition = UIPercentDrivenInteractiveTransition()
    
    var selectedView: UIView?
    var closeBlock: (() -> Void)?

    var isInteractive: Bool = false

    private var canTapDismiss: Bool
    init(canTapDismiss: Bool = true) {
        self.canTapDismiss = canTapDismiss
        super.init()
    }

    deinit {
    }
}

extension TransitionManager: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let controller = PresentationController(presentedViewController: presented, presenting: presenting)
        controller.closeBlock = { [weak self] in
            self?.closeBlock?()
        }
        controller.canTapDismiss = canTapDismiss
        controller.alignment = alignment
        controller.sizeRatio = sizeRatio
        return controller
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator(style: transitionStyle, selectedView: selectedView)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator(style: transitionStyle)
    }

    //要求您的委托人提供呈现视图控制器时要使用的交互式动画器对象。
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return isInteractive ? presentTransition : nil
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return isInteractive ? dismissTransition : nil
    }
}
