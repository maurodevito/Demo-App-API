//
//  TabBarViewController.swift
//  Demo App API
//
//  Created by Mauro De Vito on 01/09/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    lazy public var initialTabBar: UINavigationController = {
        let initialTabBar = UINavigationController()
        initialTabBar.viewControllers = [DashboardViewController.storyboardInstance()]
//        let title = "AAAA"
//        let defaultImage = UIImage(named: "tabItem_Sposi")!
//        let selectedImage = UIImage(named: "tabItem_invitati")!
//        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
//        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
        let tabBarItem = UITabBarItem(title: "A", image: nil, selectedImage: nil)
        initialTabBar.tabBarItem = tabBarItem
        return initialTabBar
    }()
    
    
    lazy public var demoTabBar: DemoViewController = {
        let demoTabBar = DemoViewController.storyboardIstance()
        let tabBarItem = UITabBarItem(title: "B", image: nil, selectedImage: nil)
        demoTabBar.tabBarItem = tabBarItem
        return demoTabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.viewControllers = [initialTabBar, demoTabBar]
    }

}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("TabBarViewController.tabBarController()")
        if let titleViewController = viewController.title {
            print("Selected \(titleViewController)")
        }
        
    }
}
