//
//  OtherViewController.swift
//  demo
//
//  Created by Jason on 2020/11/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let with = self.view.frame.width
        
        let view = ContextChartView.init(frame: CGRect(x: 0, y: 0, width: with, height: with))
        self.view.addSubview(view)
        
        let view2 = RecommandHeaderCircleView.init(frame: CGRect(x: 0, y: 400, width: with, height: with))
//        view2.addCircleWithProgress()
        self.view.addSubview(view2)
        
        
//        let view1 = HeaderCircleView.init(frame: CGRect(x: 0, y: 300, width: with, height: with))
//        view.addSubview(view1)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
