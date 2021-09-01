//
//  DemoViewController.swift
//  Demo App API
//
//  Created by Mauro De Vito on 01/09/2021.
//

import UIKit

class DemoViewController: BaseViewController<DemoManager> {
    
    static func storyboardIstance() -> DemoViewController {
        let storyboard = UIStoryboard(name: "Demo", bundle: nil)
        let viewController = (storyboard.instantiateViewController(withIdentifier: "demoStoryboardID") as? DemoViewController)!
        return viewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.viewControllerDelegate = self
    }
    
}


extension DemoViewController: DemoControllerDelegate {
    
}
