//
//  TranDimissAnimator.swift
//  CustomTransitionTutorial
//
//  Created by Jason on 2020/12/12.
//  Copyright © 2020 Tung. All rights reserved.
//

import UIKit
final class TranDimissAnimator: NSObject, UIViewControllerAnimatedTransitioning {


    /// 选中cell
    private var selectedCellSnapshot: UIView?
    /// 转场前图片的frame
    private var cellSelectedRect: CGRect = .zero
    /// 转场后图片的frame
    private var cellAfterRect: CGRect = .zero
    private var selectedImageView: UIImageView

    init(selectedCellSnapshot: UIView?, cellSelectedRect: CGRect, cellAfterRect: CGRect, imageView: UIImageView? = nil) {
        self.selectedCellSnapshot = selectedCellSnapshot
        self.cellSelectedRect = cellSelectedRect
        self.cellAfterRect = cellAfterRect
        self.selectedImageView = imageView ?? UIImageView()
        super.init()

    }

    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        containerView.addSubview(toVC.view)
        
        //图片背景的空白view (设置和控制器的背景颜色一样，给人一种图片被调走的假象)
        let imgBgWhiteView = UIView.init(frame: cellSelectedRect)
        imgBgWhiteView.backgroundColor = bgcolor
        containerView.addSubview(imgBgWhiteView)
        
        //有渐变的黑色背景
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = bgcolor
        bgView.alpha = 1
        containerView.addSubview(bgView)
        
        // 过渡图片
//        selectedCellSnapshot?.frame = cellAfterRect
//        transitionContext.containerView.addSubview(selectedCellSnapshot ?? UIView())
        // 过渡图片
        let imageView = UIImageView.init(image: selectedImageView.image)
        imageView.frame = cellAfterRect
        imageView.contentMode = .scaleToFill
        containerView.addSubview(imageView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseOut) {
            
//            self.selectedCellSnapshot?.frame = self.cellSelectedRect
            imageView.frame = self.cellSelectedRect
            bgView.alpha = 0
            
        } completion: { (isFinished) in
                let wasCancelled = transitionContext.transitionWasCancelled
                
                imgBgWhiteView.removeFromSuperview()
                bgView.removeFromSuperview()
                self.selectedCellSnapshot?.removeFromSuperview()
                //通知系统动画执行完毕
                transitionContext.completeTransition(!wasCancelled)
        }

    }
    
}
