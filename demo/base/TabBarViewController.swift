//
//  TabBarViewController.swift
//  demo
//
//  Created by Jason on 2020/8/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var selectIndexLast : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: nil, action: nil)
        
        self.tabBar.clipsToBounds = true
        let home = HomeViewController()
        let navigationVC = NavigationController()
        let navhome = navigationVC.navigationControllerWithRootViewController(Vc: home, title: "home")
        
        
        let ui = SwiftUIViewController()
        let navmy = navigationVC.navigationControllerWithRootViewController(Vc: ui, title: "swiftUI")
        // 添加到tabbarVc中
        self.viewControllers = [navhome, navmy]
        
        //设置默认选中为第一个
        self.tabBarController?.selectedIndex = 0
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        selectIndexLast = self.selectedIndex
    }
    
    
}
