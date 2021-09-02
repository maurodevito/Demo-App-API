//
//  DashboardViewController.swift
//  Demo App API
//
//  Created by Mauro De Vito on 01/09/2021.
//

import UIKit

class DashboardViewController: BaseViewController<DashboardManager> {
    
    var posts: [PostUIModel] = []
    
    static func storyboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let navController = (storyboard.instantiateViewController(withIdentifier: "dashboardStoryboardID") as? UINavigationController)!
        return navController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.viewControllerDelegate = self
        self.manager.viewDidLoad()
    }
    
}


extension DashboardViewController: DashboardControllerDelegate {
    func setModel(posts: [PostUIModel]) {
        self.posts = posts
    }
    
    
}
