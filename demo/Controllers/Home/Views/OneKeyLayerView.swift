//
//  OneKeyLayerView.swift
//  YouZhiYuan
//
//  Created by Jason on 2020/6/24.
//  Copyright © 2020 泽i. All rights reserved.
//

import UIKit

///新高考一键填报动画view
class OneKeyLayerView: UIView {
    
    var centerLayer: CAShapeLayer!
    var centerPath: UIBezierPath!
    var copyLayer: CAShapeLayer!
    var copyLayer1: CAShapeLayer!
    var layerArr:[CAShapeLayer] = []
    
    var centerBackLayer: CAShapeLayer!
    var superLayer: CAShapeLayer!

    
    var dataArr: [CGPoint] = []
    var dataArr1: [CGPoint] = []
    var dataArr2: [CGPoint] = []
    
    var state: State = .normal {
        didSet {
            updateState()
        }
    }

    
    let centerWith: CGFloat = 154
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRankAllPoint()
        initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRankAllPoint()
        initSubViews()
    }
    
    func initSubViews() {
        self.backgroundColor = .clear
        let width = self.bounds.size.width
        
        superLayer = CAShapeLayer()
        superLayer.position = CGPoint(x: width/2, y: width/2)
        superLayer.bounds = CGRect(x: 0, y: 0, width: width, height: width)
        self.layer.addSublayer(superLayer)
        
        centerBackLayer = CAShapeLayer()
        centerBackLayer.position = CGPoint(x: width/2, y: width/2)
        centerBackLayer.bounds = CGRect(x: 0, y: 0, width: 180, height: 180)
        self.layer.addSublayer(centerBackLayer)
        
        let centerPoint = CGPoint(x: centerBackLayer.frame.width / 2, y: centerBackLayer.frame.height / 2)
        ///中心圆
//        centerLayer = CAShapeLayer()
//        centerLayer.bounds = CGRect(x: 0, y: 0, width: centerWith, height: centerWith)
//        centerLayer.position = CGPoint(x: width/2, y: width/2)
//        centerPath = UIBezierPath(ovalIn: centerLayer.bounds)
//        centerLayer.path = centerPath.cgPath
//        centerLayer.fillColor = UIColor(hex: 0x15AFDD).cgColor
//        centerLayer.strokeColor = UIColor.init(white: 1, alpha: 0.8).cgColor
//        centerLayer.lineWidth = 1
        
        ///多个赋值层
        copyLayer = CAShapeLayer()
        copyLayer.bounds = CGRect(x: 0, y: 0, width: centerWith, height: centerWith)
        copyLayer.position = centerPoint
        copyLayer.path = UIBezierPath(ovalIn: copyLayer.bounds).cgPath
        copyLayer.fillColor = UIColor.init(white: 1, alpha: 0.2).cgColor
        
        ///多个赋值层
        copyLayer1 = CAShapeLayer()
        copyLayer1.bounds = CGRect(x: 0, y: 0, width: centerWith, height: centerWith)
        copyLayer1.position = centerPoint
        copyLayer1.path = UIBezierPath(ovalIn: copyLayer.bounds).cgPath
        copyLayer1.fillColor = UIColor.init(white: 1, alpha: 0.2).cgColor

        // 关键代码
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.bounds = CGRect(x: 0, y: 0, width: 180, height: 180)
        replicatorLayer.position = CGPoint(x: centerPoint.x - 15, y: centerPoint.y - 10)
        replicatorLayer.instanceCount = 4
        replicatorLayer.instanceAlphaOffset = 0.1
        // 1.2.设置复制子层偏移量，不包含原始层，这里是相对于原始层的x轴的偏移量
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(8, 8, 0)
        // 1.3.设置复制层的动画延迟事件
        replicatorLayer.instanceDelay = 0.1
        replicatorLayer.addSublayer(copyLayer)
        
        // 关键代码
        let replicatorLayer1 = CAReplicatorLayer()
        replicatorLayer1.bounds = CGRect(x: 0, y: 0, width: 180, height: 180)
        replicatorLayer1.position = CGPoint(x: centerPoint.x + 15, y: centerPoint.y - 10)
        replicatorLayer1.instanceCount = 4
        replicatorLayer1.instanceAlphaOffset = 0.1

        // 1.2.设置复制子层偏移量，不包含原始层，这里是相对于原始层的x轴的偏移量
        replicatorLayer1.instanceTransform = CATransform3DMakeTranslation(-8, 8, 0)
        // 1.3.设置复制层的动画延迟事件
        replicatorLayer1.instanceDelay = 0.1
        replicatorLayer1.addSublayer(copyLayer1)
        
        
        centerBackLayer.addSublayer(replicatorLayer)
        centerBackLayer.addSublayer(replicatorLayer1)
        self.addSubview(self.centerView)
        self.centerView.addSubview(self.centerButton)
        self.centerView.addSubview(self.endButton)
        normalState()
        
    }
    
    func addSubCircleView() {
        
        superLayer.sublayers?.forEach({ $0.removeFromSuperlayer()})
        
        for item in self.dataArr {
            let layer = CAShapeLayer()
            let with = CGFloat(arc4random() % UInt32(9)) + 1
            layer.bounds = CGRect(x: 0, y: 0, width: with, height: with)
            layer.position = item
            layer.path = UIBezierPath(ovalIn: layer.bounds).cgPath
            let aplpha = NSString.init(string: "0.\(Int(arc4random() % 9) + 1)").floatValue
            layer.fillColor = UIColor.init(white: 1, alpha: CGFloat(aplpha)).cgColor
            layerArr.append(layer)
            superLayer.addSublayer(layer)
        }
        
    }
    
   @objc func starAnimation() {
        self.state = .loading
         /// 旋转动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")

        rotationAnim.toValue = M_PI * 2 //结束角度
        rotationAnim.repeatCount = MAXFLOAT // 重复次数
        rotationAnim.repeatDuration = 10
        rotationAnim.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
        centerBackLayer.add(rotationAnim, forKey: nil)
        
        DispatchQueue.global().async {
            
            self.removeFirstSubLayers()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.addOtherSubCircleView()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.addOtherSubCircleView()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.addOtherSubCircleView()
            }
        }
        
        ///模拟结束
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.state = .end
        }
        
    }
    
    func removeFirstSubLayers() {
        DispatchQueue.main.async {
            let width = self.bounds.size.width

            ///移动动画
            for item in self.layerArr {
                let moveAnim = CABasicAnimation(keyPath: "position")
                moveAnim.duration = 1
                moveAnim.repeatCount = 1
                moveAnim.fromValue = item.position
                moveAnim.toValue = CGPoint(x: width/2, y: width/2)
                moveAnim.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
                moveAnim.fillMode = .forwards
                moveAnim.isRemovedOnCompletion = false
                item.add(moveAnim, forKey: nil)
            }
        }
        
    }
    
    ///添加其他周围圆圈
    func addOtherSubCircleView() {
        let width = self.bounds.size.width

        var layerArr:[CAShapeLayer] = []
        
        for item in self.dataArr1 {
            let layer = CAShapeLayer()
            let with = CGFloat(arc4random() % UInt32(9)) + 1
            layer.bounds = CGRect(x: 0, y: 0, width: with, height: with)
            layer.position = item
            layer.path = UIBezierPath(ovalIn: layer.bounds).cgPath
            let aplpha = NSString.init(string: "0.\(Int(arc4random() % 9) + 1)").floatValue
            layer.fillColor = UIColor.init(white: 1, alpha: CGFloat(aplpha)).cgColor
            layerArr.append(layer)
            superLayer.addSublayer(layer)
        }
        
        ///移动动画
        for item in layerArr {
            let moveAnim = CABasicAnimation(keyPath: "position")
            moveAnim.duration = 1
            moveAnim.repeatCount = 1
            moveAnim.fromValue = item.position
            moveAnim.toValue = CGPoint(x: width/2, y: width/2)
            moveAnim.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
            moveAnim.fillMode = .forwards
            moveAnim.isRemovedOnCompletion = false
            item.add(moveAnim, forKey: nil)
        }
        
    }

    
    
    
    func setRankAllPoint() {
        
        let width = self.bounds.size.width
        let leftWith = (width - centerWith) / 2
        
        for index in 0 ..< 3 {
            var array: [CGPoint] = []
            ///左边
            for _ in 0 ..< 10 {
                let x = CGFloat(arc4random() % UInt32(leftWith))
                let y = CGFloat(arc4random() % UInt32(width))
                array.append(CGPoint(x: x, y: y))
            }
            ///右边
            for _ in 0 ..< 10 {
                let x = CGFloat(arc4random() % UInt32(leftWith)) + width - leftWith
                let y = CGFloat(arc4random() % UInt32(width))
                array.append(CGPoint(x: x, y: y))
            }
            
            ///头部
            for _ in 0 ..< 10 {
                let x = CGFloat(arc4random() % UInt32(centerWith)) + leftWith
                let y = CGFloat(arc4random() % UInt32(leftWith))
                array.append(CGPoint(x: x, y: y))
            }
            ///尾部
            for _ in 0 ..< 10 {
                let x = CGFloat(arc4random() % UInt32(centerWith)) + leftWith
                let y = CGFloat(arc4random() % UInt32(leftWith)) + width - leftWith
                array.append(CGPoint(x: x, y: y))
            }
            
            switch index {
            case 0:
                self.dataArr = array
            case 1:
                self.dataArr1 = array
            case 2:
                self.dataArr2 = array
            default:
             break
            
            }
        }
        
    }
    
   ///中心view
    lazy var centerView: UIView = {
        let width = self.bounds.width
        let view = UIView()
        view.center = CGPoint(x: width / 2, y: width / 2)
        view.bounds = CGRect(x: 0, y: 0, width: self.centerWith, height: self.centerWith)
        view.layer.cornerRadius = self.centerWith / 2
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
        return view
    }()
    
    ///中心图片
    lazy var centerButton: UIButton = {
        let button = UIButton()
        button.center = CGPoint(x: self.centerView.bounds.width / 2, y: self.centerView.bounds.height / 2)
        button.bounds = self.centerView.bounds
        button.setImage(UIImage.init(named: "oneKey_begin"), for: .normal)
        button.addTarget(self, action: #selector(starAnimation), for: .touchUpInside)
        return button
    }()
    
    lazy var endButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.backgroundColor = UIColor.init(white: 1, alpha: 0.6)
        button.layer.cornerRadius = self.centerWith / 2
        button.center = CGPoint(x: self.centerView.bounds.width / 2, y: self.centerView.bounds.height / 2)
        button.bounds = CGRect(x: 0, y: 0, width: self.centerWith, height: self.centerWith)
        button.setImage(UIImage.init(named: "onekey_end"), for: .normal)
        return button
        
    }()
    
    
    
}
extension OneKeyLayerView {
    enum State {
        /// 默认
        case normal
        /// 动画
        case loading
        /// 完成
        case end
    }
    
    func updateState() {
        switch state {
        case .normal:
            normalState()
        case .loading:
            loadingState()
        case .end:
            endState()
        }
    }
    
    func normalState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.centerBackLayer.removeAllAnimations()
            self.addSubCircleView()
            self.centerView.bounds = CGRect(x: 0, y: 0, width: self.centerWith, height: self.centerWith)
            self.centerView.layer.cornerRadius = self.centerWith / 2

            self.centerButton.isHidden = false
            self.centerButton.center = CGPoint(x: self.centerView.bounds.width / 2, y: self.centerView.bounds.height / 2)
            self.endButton.isHidden = true

        }
    }
    
   @objc func loadingState() {
//        starAnimation()
     self.centerButton.setImage(UIImage.init(named: "oneKey_ing"), for: .normal)
    
    }
    
    func endState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.centerBackLayer.sublayers?.forEach({ $0.removeFromSuperlayer()})
            self.centerBackLayer.removeAllAnimations()
            self.centerButton.isHidden = true
            self.endButton.isHidden = false
            self.centerView.bounds = CGRect(x: 0, y: 0, width: 170, height: 170)
            self.centerView.layer.cornerRadius = 170 / 2
            self.endButton.center = CGPoint(x: self.centerView.bounds.width / 2, y: self.centerView.bounds.height / 2)
        }
    }
    
    
}
extension UIColor {
    /// 16进制颜色
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0xFF00) >> 8) / 255
        let blue = CGFloat(hex & 0xFF) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


