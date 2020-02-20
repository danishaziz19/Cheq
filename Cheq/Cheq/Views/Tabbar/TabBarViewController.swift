//
//  TabBarViewController.swift
//  Cheq
//
//  Created by Danish Aziz on 20/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setDefaults()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //self.delegate = self
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setDefaults(){
        self.tabBar.tintColor = UIColor.blue
        self.tabBar.unselectedItemTintColor = UIColor.gray
        self.tabBar.isOpaque = true
        self.tabBar.isTranslucent = false
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8.5)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8.5)], for: .selected)
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(tabBarController.selectedIndex)
    }
}
