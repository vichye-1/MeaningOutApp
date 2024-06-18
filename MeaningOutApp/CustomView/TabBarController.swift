//
//  TabBarController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/13/24.
//

import UIKit

class TabBarController: UITabBarController {    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = Constant.Colors.mainOrange
        tabBar.unselectedItemTintColor = Constant.Colors.lightGray
        
        let main = NoRecentMainViewController()
        let nav1 = UINavigationController(rootViewController: main)
        nav1.tabBarItem = UITabBarItem(title: Constant.TabBarItemStrings.search.rawValue, image: Constant.ButtonImages.serachButton, tag: 0)
        
        let setting = MainSettingViewController()
        let nav2 = UINavigationController(rootViewController: setting)
        nav2.tabBarItem = UITabBarItem(title: Constant.TabBarItemStrings.settings.rawValue, image: Constant.ButtonImages.personButton, tag: 1)
        
        setViewControllers([nav1, nav2], animated: true)
    }
}
