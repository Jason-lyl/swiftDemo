//
//  ViewController.swift
//  demo
//
//  Created by Jason on 2020/6/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var oneKeyView: OneKeyLayerView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "demo"
        // Do any additional setup after loading the view.
        setUpViews1()
        
    }
    
    func setUpViews() {
        self.view.backgroundColor = UIColor.white
        let view = ProbabilityHalfCircleView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        self.view.addSubview(view)
        
        let otherView = ProgressView.init(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
        self.view.addSubview(otherView)
        otherView.setProgress(Int(84), true)
    }
    
    func setUpViews1() {
        self.view.backgroundColor = UIColor(hex: 0x3AD4D0)
        oneKeyView = OneKeyLayerView.init(frame: CGRect(x: 40, y: 100, width: self.view.bounds.width - 80, height: 300))
        self.view.addSubview(oneKeyView!)
        
        
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 500, width: 100, height: 100)
        button.addTarget(self, action: #selector(buttonClick), for: .touchDown)
        button.backgroundColor = .red
        self.view.addSubview(button)
        
    }
    
    @objc func buttonClick() {
//        oneKeyView?.starAnimation()
        let vc = MyTableViewController.init(style: .plain
        )
        self.present(vc, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    


}

