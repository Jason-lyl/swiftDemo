//
//  TransitionManager.swift
//  YouZhiYuan
//
//  Created by 泽i on 2018/10/8.
//  Copyright © 2018年 泽i. All rights reserved.
//

import UIKit

/// 转场动画管理类
class TranAnimatorManager: NSObject {
    
    var selectedCellSnapshot: UIView?
    var cellSelectedRect: CGRect = .zero
    var afterRect: CGRect = .zero
    var gesture: UIPanGestureRecognizer?
    var imageView: UIImageView?
    var firstView: UIView?
    
    
    lazy var drivenInteractive = GestureDrivenInteractiveTransition.init(gestureRecognizer: gesture)

     init(stype: UIView? = nil) {
        super.init()
    }

    
}

extension TranAnimatorManager: UIViewControllerTransitioningDelegate {
    

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let shapShot = selectedCellSnapshot,
              let first = firstView,
              let image = imageView else {
            return nil
        }
        
        return TranPresentAnimator(selectedCellSnapshot: shapShot, cellSelectedRect: cellSelectedRect, cellAfterRect: afterRect, imageView: image, firstView: first)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let shapShot = self.selectedCellSnapshot ,
              let first = firstView,
              let image = imageView else {
            return nil
        }
        
        return TranDimissAnimator(selectedCellSnapshot: shapShot, cellSelectedRect: cellSelectedRect, cellAfterRect: afterRect, imageView: image, firstView: first)
        
    }
    
//     func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        guard let gestrue = self.gesture else {
//            return nil
//        }
//        return GestureDrivenInteractiveTransition(gestureRecognizer: gestrue)
//    }
    
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
