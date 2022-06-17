//
//  TabBarController.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/17.
//

import UIKit

class TabBarController: UITabBarController {
    
    private lazy var todayViewController: UIViewController = {
        let viewController = TodayViewController()
        let tapbar = UITabBarItem(title: "투데이", image: UIImage(systemName: "mail"), tag: 0)
        
        viewController.tabBarItem = tapbar
        
        return viewController
    }()
    
    private lazy var appViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: AppViewController())
        let tapbar = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 1)
        
        viewController.tabBarItem = tapbar
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [todayViewController, appViewController]
        
    }
}
