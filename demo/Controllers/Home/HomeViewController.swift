//
//  HomeViewController.swift
//  demo
//
//  Created by Jason on 2020/8/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit
import Kingfisher


class HomeViewController: UIViewController {
    
    var oneKeyView: OneKeyLayerView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        navigationItem.title = "demo"
        // Do any additional setup after loading the view.
        setUpViews1()
        let arr = ["1", "2", "3"]
        let arr1: [String] = []
        print([arr, arr1].flatMap{ $0 })
        print([arr, arr1].compactMap{ $0 })
        print([arr, arr1].filter { $0.count > 0 })
    }
    
    
    func compare()  {
        
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
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 250, y: 500, width: 100, height: 100)
        let url = "https://wx.qlogo.cn/mmopen/vi_32/oJJkuvBb8ZtERMerQUEkVlQdr0Y4eoMG9oQqZkGsYibVrOGSbHTWT9An6jibJY3fwI7MPrpKccWMgA33yQP2qpEg/132"
        imageView.kf.setImage(with: URL.init(string: url)!)
        view.addSubview(imageView)
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(imageViewClick))
        imageView.addGestureRecognizer(gesture)
    }
    
    @objc func imageViewClick() {
        self.navigationController?.pushViewController(GradientLayerViewController(), animated: true)
    }
    
    @objc func buttonClick() {
        oneKeyView?.starAnimation()
        let vc = MyTableViewController.init(style: .plain
        )
        self.present(vc, animated: true, completion: nil)
    }
    
    func jumpTimerVC() {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 40, left: 50, bottom: 20, right: 50)
        layout.scrollDirection = .vertical
        let with = (kScreenWidth - 100 - 15) / 2
        layout.itemSize = CGSize(width: with, height: with / 2 * 3)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        
        
        let vc = CollectionViewController.init(collectionViewLayout: layout)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setSliderVC() {
        let vc = SliderViewController()
        present(vc, animated: true, completion: nil)
        
    }
    
    func setCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 40, left: 30, bottom: 20, right: 30)
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        let vc = ShadowViewController.init(collectionViewLayout: layout)
        present(vc, animated: true, completion: nil)
        print("\(self.view.clipsToBounds)")
        
    }
    
    
    func setDouble()  {
        
        let arr: [Double] = [0, 4, 4.01, 4.1111, 4.192, 4.190, 4.198,4.00]
        
        for index in 0 ..< arr.count {
            print(arr[index].probabilityValue)
        }
        print("=========")
        for index in 0 ..< arr.count {
            print(arr[index].roundTo(places: 2))
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    
}

extension Double {
    
    public func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    
    var probabilityValue: String {
        //先四舍五入两位
        let divisor = pow(10.0, Double(2))
        let value = (self * divisor).rounded() / divisor
        
        var str = "\(value)"
        if str.contains(".") {
            let arr = str.components(separatedBy: ".")
            if arr[1] == "0" {
                str = "\(Int(value))"
            }
        }
        return str
        
    }
}
