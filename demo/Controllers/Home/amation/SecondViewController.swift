//
//  SecondViewController.swift
//  demo
//
//  Created by Jason on 2020/12/12.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    var data: CellData!
    
    private var animatedTransition: TranAnimatorManager?
    
    private let imageView = UIImageView()
    
    private var transitionImgViewCenter: CGPoint = .zero
    private var selectedCellFrame: CGRect = .zero
    
    var selectedCellImageViewSnapshot: UIView?
    
    var afterRect: CGRect = .zero
    
    let animator = TranAnimatorManager()

    convenience init(selectedCellSnapshot: UIView, cellSelectedRect: CGRect, cellAfterRect: CGRect, selectedImage: UIImageView) {
        self.init(nibName: nil, bundle: nil)
        animator.selectedCellSnapshot = selectedCellSnapshot
        animator.cellSelectedRect = cellSelectedRect
        animator.afterRect = cellAfterRect
        animator.imageView = selectedImage
        modalPresentationStyle = .fullScreen

        transitioningDelegate = animator
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgcolor

        imageView.image = data.image
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(kScreenWidth / 2 * 3)
        }
        
        
        let closeButton = UIButton()
        closeButton.setImage(UIImage.init(named: "cross"), for: .normal)
        closeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(16)
            make.top.equalTo(self.view).offset(60)
            make.width.height.equalTo(30)
        }
        
//        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(gestureRecognizeDidUpdate(_:)))
//
//        self.view.addGestureRecognizer(panGesture)
    }
    

    @objc func buttonAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func gestureRecognizeDidUpdate(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view)
        var scale = 1 - abs(translation.y / kScreenWidth)
        scale = scale < 0 ? 0 : scale

        
        switch gesture.state {
        case .began:
            animatedTransition = nil
            animatedTransition = TranAnimatorManager()
            transitioningDelegate = animatedTransition
            animatedTransition?.gesture = gesture
            
            self.dismiss(animated: true, completion: nil)
        case .changed:
            imageView.center = CGPoint(x: transitionImgViewCenter.x + translation.x * scale, y: transitionImgViewCenter.y + translation.y)
            imageView.transform = CGAffineTransform.init(scaleX: scale, y: scale)
            self.animatedTransition?.cellSelectedRect = self.selectedCellFrame
            
        case .failed, .cancelled, .ended:
            if scale > 0.95 {
                UIView.animate(withDuration: 0.2) {
                    self.imageView.center = self.transitionImgViewCenter
                    self.imageView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                } completion: { (isFinished) in
                    self.imageView.transform = .identity
                }
            }
            self.animatedTransition?.drivenInteractive.currentImageView = imageView
            self.animatedTransition?.drivenInteractive.currentImageViewFrame = imageView.frame
            self.animatedTransition?.gesture = nil
        default:
            break
        }
        
    }
}


