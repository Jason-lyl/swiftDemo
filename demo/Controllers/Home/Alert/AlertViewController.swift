//
//  AlertViewController.swift
//  Alert
//
//  Created by youzy01 on 2019/4/3.
//  Copyright © 2019 youzy. All rights reserved.
//

import UIKit

/// 弹窗操作选项
public class AlertAction: NSObject {
    private(set) var title: String = ""
    private(set) var style: Style = .default
    private var handler: ((AlertAction) -> Void)?

    convenience init(title: String, style: Style, handler: ((AlertAction) -> Void)?) {
        self.init()
        self.title = title
        self.style = style
        self.handler = handler
    }

    fileprivate weak var viewController: UIViewController?

    @objc func tapAction() {
        viewController?.dismiss(animated: true, completion: nil)
        handler?(self)
    }
}

/// 弹窗控制器
public class AlertViewController: UIViewController {

    private(set) var style: Style = .alert

    /// 头部文本
    @IBOutlet private weak var textStackView: UIStackView!
    /// 标题
    @IBOutlet private weak var titleLabel: UILabel!
    /// 信息
    @IBOutlet private weak var messageLabel: UILabel!
    /// 按钮布局视图
    @IBOutlet private weak var buttonStackView: UIStackView!
    /// 标题
    private var alertTitle: String?
    /// 描述
    private var message: String?
    /// 自定义描述
    private var customMessage: NSAttributedString?

    private let alertTransition = AlertTransition()
    private let sheetTransition = SheetTransition()

    /// 标题和副标题弹框
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 描述
    ///   - preferredStyle: 弹框样式
    public init(title: String?, message: String? = nil, preferredStyle: Style) {
        super.init(nibName: "AlertViewController", bundle: nil)
        self.alertTitle = title
        self.message = message
        self.style = preferredStyle

        modalPresentationStyle = .custom
        switch preferredStyle {
        case .actionSheet:
            transitioningDelegate = sheetTransition
        case .alert:
            transitioningDelegate = alertTransition
        }
    }
    

    /// 自定义描述弹框
    /// - Parameters:
    ///   - customMessage: 自定义描述
    ///   - preferredStyle: 弹框样式
    public init(customMessage: NSAttributedString? = nil, preferredStyle: Style) {
        super.init(nibName: "AlertViewController", bundle: nil)
        self.customMessage = customMessage
        self.style = preferredStyle
        modalPresentationStyle = .custom
        switch preferredStyle {
        case .actionSheet:
            transitioningDelegate = sheetTransition
        case .alert:
            transitioningDelegate = alertTransition
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        initButtons()
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
    }

    /// 添加弹框操作类型
    /// - Parameter action: 弹框类型行为
    public func addAction(_ action: AlertAction) {
        action.viewController = self
        actions.append(action)
    }

    private(set) var actions: [AlertAction] = []
}

private extension AlertViewController {

    /// 设置文本（标题，信息）
    func setText() {
        guard customMessage == nil else {
            titleLabel.isHidden = true
            textStackView.spacing = 0
            messageLabel.attributedText = customMessage
            return
        }

        titleLabel.text = alertTitle
        messageLabel.text = message
        if message?.isEmpty ?? true || alertTitle?.isEmpty ?? true {
            textStackView.spacing = 0
        } else {
            textStackView.spacing = 16
        }
    }

    func initButtons() {
        if style == .actionSheet {
            buttonStackView.axis = .vertical
            buttonStackView.distribution = .fill
            buttonStackView.spacing = 16
        } else {
            //按钮小于等于2个 横向布局，否则纵向布局
            buttonStackView.axis = actions.count <= 2 ? .horizontal : .vertical
            buttonStackView.distribution = actions.count <= 2 ? .fillEqually : .fill
        }

        for action in actions {
            let button = AlertButton(action: action)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 36)
            ])
            buttonStackView.addArrangedSubview(button)
        }
    }
}

extension AlertViewController {
    /// 弹框样式类型
    public enum Style: Int {
        /// 底部弹出
        case actionSheet
        /// 中间弹出
        case alert
    }
}

extension AlertAction {
    /// 弹框操作类型
    /// 一般取消左边 默认右边
    public enum Style: Int {
        // 默认
        case `default`
        // 取消
        case cancel
    }
}
