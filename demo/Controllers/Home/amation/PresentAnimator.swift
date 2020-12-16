//
//  TranPresentAnimator.swift
//  CustomTransitionTutorial
//
//  Created by Jason on 2020/12/12.
//  Copyright © 2020 Tung. All rights reserved.
//

import UIKit
final class TranPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {

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

        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        containerView.addSubview(fromVC.view)
        
        guard let toView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        containerView.addSubview(toView)
        toView.isHidden = true
        
        
        
        //图片背景的空白view (设置和控制器的背景颜色一样，给人一种图片被调走的假象)
        let imgBgWhiteView = UIView.init(frame: cellSelectedRect)
        imgBgWhiteView.backgroundColor = bgcolor
        containerView.addSubview(imgBgWhiteView)
        
        //有渐变的黑色背景
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = bgcolor
        bgView.alpha = 0
        containerView.addSubview(bgView)
        
        // 过渡图片
        let imageView = UIImageView.init(image: selectedImageView.image)
        imageView.contentMode = .scaleToFill
        imageView.frame = cellSelectedRect
        containerView.addSubview(imageView)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .allowAnimatedContent) {
            
            imageView.frame = self.cellAfterRect
            bgView.alpha = 1
            
        } completion: { (isFinished) in
            if isFinished {
                
                toView.isHidden = false
                
                imgBgWhiteView.removeFromSuperview()
                bgView.removeFromSuperview()
                imageView.removeFromSuperview()
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
                
            }
        }

    }
    
}
