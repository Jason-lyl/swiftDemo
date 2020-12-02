//
//  PresentationController.swift
//  YouZhiYuan
//
//  Created by 泽i on 2018/10/8.
//  Copyright © 2018年 泽i. All rights reserved.
//

import UIKit
import SnapKit

private let showColor = UIColor(white: 0, alpha: 0.4)
private let hideColor = UIColor(white: 0, alpha: 0)

class PresentationController: UIPresentationController {
    var canTapDismiss: Bool = true

    var alignment: Alignment = .left
    var sizeRatio: SizeRatio = SizeRatio.max
    
    var closeBlock: (() -> Void)?

    lazy var dummyView: UIView = {
        let view = UIView()
        view.backgroundColor = showColor
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissAction))
        view.addGestureRecognizer(tap)
        return view
    }()

    override func presentationTransitionWillBegin() {
        dummyView.frame = containerView?.bounds ?? CGRect.zero
        containerView?.addSubview(dummyView)

        let coordinator = presentingViewController.transitionCoordinator
        coordinator?.animate(alongsideTransition: { (_) in
            self.dummyView.backgroundColor = showColor
        }, completion: nil)
    }

    override func presentationTransitionDidEnd(_ completed: Bool) {
        guard !completed else {
            return
        }
        dummyView.removeFromSuperview()
    }

    override func dismissalTransitionWillBegin() {
        let coordinator = presentingViewController.transitionCoordinator
        coordinator?.animate(alongsideTransition: { (_) in
            self.dummyView.backgroundColor = hideColor
        }, completion: nil)
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        guard completed else {
            return
        }

        dummyView.removeFromSuperview()
    }

    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        addConstraint()
    }
}

// MARK: - 布局
extension PresentationController {
    func addConstraint() {
        guard let containerView = containerView, let presentedView = presentedView  else { return }
        presentedView.snp.makeConstraints { (make) in
            switch alignment {
            case .left, .top:
                make.left.equalTo(containerView)
                make.top.equalTo(containerView)
            case .right:
                make.right.equalTo(containerView)
                make.top.equalTo(containerView)
            case .bottom, .bottomAuto:
                make.left.equalTo(containerView)
                make.bottom.equalTo(containerView)
            case .center:
                make.center.equalTo(containerView)
            }

            switch alignment {
            case .bottomAuto:
                make.right.equalTo(containerView)
            case .center:
                make.width.equalTo(containerView).inset(40)
            default:
                make.width.equalTo(containerView)
                    .multipliedBy(sizeRatio.width)
                make.height.equalTo(containerView)
                    .multipliedBy(sizeRatio.height)
            }
        }
    }
}

extension PresentationController {
    @objc func dismissAction() {
        guard canTapDismiss else { return }
        closeBlock?()
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
