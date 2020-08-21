//
//  SwiftUIViewController.swift
//  demo
//
//  Created by Jason on 2020/8/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class SwiftUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /**
         初始化
         let datePicker = UIDatePicker.init()
         datePicker = UIDatePicker.init(frame: <#T##CGRect#>)
         datePicker = UIDatePicker.init(coder: <#T##NSCoder#>)
         */
        let datePicker = UIDatePicker.init()
        /**
         设置大小
         */
        datePicker.frame = CGRect.init(x: 60, y: 170, width: 300, height: 160)
        /**
         设置轮廓
         */
        datePicker.layer.borderWidth = 1
        datePicker.layer.borderColor = UIColor.gray.cgColor
        /**
         显示的日期的形式
         */
        datePicker.datePickerMode = .date
        datePicker.locale = Locale.init(identifier: "zh_CN")
        datePicker.calendar = Calendar.current
        datePicker.timeZone = TimeZone.current
        datePicker.date = Date.init(timeIntervalSinceNow: 1)
        self.view.addSubview(datePicker)
        
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
