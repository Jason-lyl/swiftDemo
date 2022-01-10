//
//  AlertPresentationController.swift
//  Alert
//
//  Created by youzy01 on 2019/4/3.
//  Copyright © 2019 youzy. All rights reserved.
//

import UIKit

private let showColor = UIColor(white: 0, alpha: 0.4)
private let hideColor = UIColor(white: 0, alpha: 0)

class AlertPresentationController: UIPresentationController {

    lazy var dummyView: UIView = {
        let view = UIView()
        view.backgroundColor = showColor
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissAction))
        view.addGestureRecognizer(tap)
        return view
    }()

    /// 弹出转场即将开始
    override func presentationTransitionWillBegin() {
        dummyView.frame = containerView?.bounds ?? CGRect.zero
        containerView?.addSubview(dummyView)

        let coordinator = presentingViewController.transitionCoordinator
        coordinator?.animate(alongsideTransition: { (_) in
            self.dummyView.backgroundColor = showColor
        }, completion: nil)
    }
    /// 弹出转场已经结束
    override func presentationTransitionDidEnd(_ completed: Bool) {
        guard !completed else {
            return
        }
        dummyView.removeFromSuperview()
    }
    /// 消失转场即将开始
    override func dismissalTransitionWillBegin() {
        let coordinator = presentingViewController.transitionCoordinator
        coordinator?.animate(alongsideTransition: { (_) in
            self.dummyView.backgroundColor = hideColor
        }, completion: nil)
    }
    /// 消失转场已经结束
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
extension AlertPresentationController {
    func addConstraint() {
        guard let containerView = containerView, let presentedView = presentedView  else { return }
        presentedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentedView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            presentedView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            presentedView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 40),
            presentedView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -40)
        ])
    }
}

extension AlertPresentationController {
    @objc func dismissAction() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
