//
//  OtherViewController.swift
//  demo
//
//  Created by Jason on 2020/11/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    
    
    var selected: UIView?
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let with = self.view.frame.width
        
        let chartView = ContextChartView.init(frame: CGRect(x: 0, y: 100, width: with, height: with))
        view.addSubview(chartView)
        
//        let view2 = PathChartView.init(frame: CGRect(x: 0, y: 400, width: with, height: with))
//        self.view.addSubview(view2)
        
        
//        let view1 = HeaderCircleView.init(frame: CGRect(x: 0, y: 300, width: with, height: with))
//        view.addSubview(view1)
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 500, width: 150, height: 100)
        button.backgroundColor = .red
        button.setTitle("绘图", for: .normal)
        button.addTarget(self, action: #selector(drawActions), for: .touchUpInside)
        view.addSubview(button)
    }

}

extension OtherViewController {
    @objc func drawActions() {
        let vc = DrawMainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
