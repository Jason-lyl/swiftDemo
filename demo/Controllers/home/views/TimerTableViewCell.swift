//
//  TimerTableViewCell.swift
//  demo
//
//  Created by Jason on 2020/8/11.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class TimerTableViewCell: UITableViewCell, CellConfigurable {


    @IBOutlet weak var titleLabel: UILabel!
    var count: Int  = 0
    
    var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timer = Timer.init(timeInterval: 3, target: self, selector: #selector(timeDown), userInfo: nil, repeats: true)
        if let timer = timer {
            RunLoop.current.add(timer, forMode: .common)
            timer.fire()
        }
        // Initialization code
    }
    
    func configure(_ item: Int) {
        count = item
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        if let view = newSuperview {
            
        } else {
            if self.timer != nil {
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }
    
    deinit {
        print("cell deinit")

    }
    
   @objc func timeDown() {
    count += 1
    titleLabel.text = "倒计时：\(count)"
    }
    
    static var nib: UINib? {
        return UINib(nibName: reuseableIdentifier, bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
