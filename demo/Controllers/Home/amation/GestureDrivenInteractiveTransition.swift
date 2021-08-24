//
//  GestureDrivenInteractiveTransition.swift
//  CustomTransitionTutorial
//
//  Created by Jason on 2020/12/12.
//  Copyright © 2020 Tung. All rights reserved.
//

import UIKit


class GestureDrivenInteractiveTransition: UIPercentDrivenInteractiveTransition {

    // 图片的frame
    var beforeImageViewFrame: CGRect = .zero
    // 当前图片的frame
    var currentImageViewFrame: CGRect = .zero
    /// 当前图片
    var currentImageView: UIImageView?
    
    var gestureRecognizer: UIPanGestureRecognizer
    
    weak var transitionContext: UIViewControllerContextTransitioning?
    
    
    deinit {
        gestureRecognizer.removeTarget(self, action: #selector(gestureRecognizeDidUpdate(_:)))
    }
    
    // MARK: - private 属性
    private lazy var bgView = UIView()
    private lazy var fromView = UIView()
    private var beforeImgWhiteView: UIView?
    private var blackBgView: UIView?

    private var isFirst: Bool = false
    
     init(gestureRecognizer: UIPanGestureRecognizer? = nil) {
        self.gestureRecognizer = gestureRecognizer ?? UIPanGestureRecognizer()
        super.init()
        self.gestureRecognizer.addTarget(self, action: #selector(gestureRecognizeDidUpdate(_:)))
        
        
     }
    
    @objc func gestureRecognizeDidUpdate(_ gesture: UIPanGestureRecognizer) {

        let scrale = percentForGesture(gesture: gesture)
        
        if isFirst {
            beginInterPercent()
            isFirst = false
        }
        
        switch gesture.state {
        case .began:
            break
        case .changed:
            let scale = percentForGesture(gesture: gesture)
            update(scale)
            blackBgView?.alpha = scale * scale * scale
        case .ended:
            if scrale > 0.95 {
                cancel()
                interPercentCancel()
            } else {
                finish()
                interPercentFinish(scrale)
            }
        default:
            cancel()
            interPercentCancel()
        }
        
        
        
    }
    
    func percentForGesture(gesture: UIPanGestureRecognizer) -> CGFloat {
        let translation = gesture.translation(in: gesture.view)
        var scale = 1 - abs(translation.y / kScreenHeight)
        scale = scale < 0 ? 0 : scale
        return scale
    }
    
    /// 开始
    func beginInterPercent() {
        
        guard let transitionContext = transitionContext else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        guard let toView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        containerView.addSubview(toView)
        
        //图片背景白色的空白view
        beforeImgWhiteView = UIView.init(frame: self.beforeImageViewFrame)
        beforeImgWhiteView?.backgroundColor = .white
        containerView.addSubview(beforeImgWhiteView ?? UIView())
        
        //有渐变的黑色背景
        blackBgView = UIView.init(frame: containerView.bounds)
        blackBgView?.backgroundColor = .gray
        containerView.addSubview(blackBgView ?? UIView())
        
        // fromview
        
        guard let fromView = transitionContext.view(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        fromView.backgroundColor = .clear
        containerView.addSubview(fromView)
    
        
    }
    
    /// 取消
    func interPercentCancel() {
        guard let transitionContext = transitionContext else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        fromView.backgroundColor = .gray
        
        containerView.addSubview(fromView)
        
        blackBgView?.removeFromSuperview()
        beforeImgWhiteView?.removeFromSuperview()
        blackBgView = nil
        beforeImgWhiteView = nil
        
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        
        
    }
    
    /// 完成
    func interPercentFinish(_ scale: CGFloat) {
        
        guard let transitionContext = transitionContext else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        guard let toView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        
        containerView.addSubview(toView)
        
        
        //图片背景的空白view (设置和控制器的背景颜色一样，给人一种图片被调走的假象)
        let imgBgWhiteView = UIView.init(frame: beforeImageViewFrame)
        imgBgWhiteView.backgroundColor = .white
        containerView.addSubview(imgBgWhiteView)
        
        //有渐变的黑色背景
        let bgView = UIView.init(frame: containerView.bounds)
        bgView.backgroundColor = .gray
        bgView.alpha = scale
        containerView.addSubview(bgView)
        
        // 过渡图片
        let transitionImgView = UIImageView.init()
        transitionImgView.image = currentImageView?.image
        transitionImgView.clipsToBounds = true
        transitionImgView.frame = currentImageViewFrame
        containerView.addSubview(transitionImgView)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveLinear) {
            
            transitionImgView.frame = self.beforeImageViewFrame
            bgView.alpha = 0
            
        } completion: { (isFinished) in
            if isFinished {
                let wasCancelled = transitionContext.transitionWasCancelled
                
                self.blackBgView?.removeFromSuperview()
                self.beforeImgWhiteView?.removeFromSuperview()
                self.blackBgView = nil
                self.beforeImgWhiteView = nil
                
                imgBgWhiteView.removeFromSuperview()
                bgView.removeFromSuperview()
                transitionImgView.removeFromSuperview()
                
                transitionContext.completeTransition(!wasCancelled)
                
            }
        }
    }
}

extension GestureDrivenInteractiveTransition {
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
    }
}
