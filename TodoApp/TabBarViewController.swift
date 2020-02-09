//
//  TabBarViewController.swift
//  TodoApp
//
//  Created by Risa Kojima on 2020/02/09.
//  Copyright © 2020 Kojima Lisa. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    let selectIconNames = ["calendar_checked", "list_checked"]
    let unseletedIconNames = ["calendar", "list"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.delegate = self
        
        if let count = self.tabBar.items?.count {
            for i in 0...count-1 {
                let imageNameForSelectedState   = selectIconNames[i]
                let imageNameForUnselectedState = unseletedIconNames[i]
                
                self.tabBar.items?[i].selectedImage = UIImage(named: imageNameForSelectedState)?.withRenderingMode(.alwaysOriginal)
                self.tabBar.items?[i].image = UIImage(named:                                                                                                                       imageNameForUnselectedState)?.withRenderingMode(.alwaysOriginal)
            }
        }
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: AppColors.lightGray], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: AppColors.gray], for: .selected)
        tabBar.barTintColor = UIColor.white
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
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
