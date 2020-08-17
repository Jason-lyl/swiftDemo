//
//  NavigationController.swift
//  demo
//
//  Created by Jason on 2020/8/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: nil, action: nil)
        let navbar = UINavigationBar.appearance()
        navbar.setBackgroundImage(UIImage.init(named: ""), for: .default)
        //按钮默认值
        let tabbarItem = UITabBarItem.appearance()
       
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.strokeColor: UIColor.brown], for: .normal)
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.strokeColor: UIColor.red], for: .selected)
    }
    
    func navigationControllerWithRootViewController(Vc: UIViewController, image: UIImage? = nil, selImage: UIImage? = nil, title: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: Vc)
        nav.tabBarItem.title = title
//        nav.tabBarItem.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        nav.tabBarItem.selectedImage = selImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        nav.tabBarItem?.imageInsets = UIEdgeInsets(top: 6, left: -2, bottom: -6, right: 2)
        return nav;
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
