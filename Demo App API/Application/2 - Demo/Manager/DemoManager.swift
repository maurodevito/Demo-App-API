//
//  DemoManager.swift
//  Demo App API
//
//  Created by Mauro De Vito on 01/09/2021.
//

import Foundation

class DemoManager: BaseManager {
    weak var viewControllerDelegate: DemoControllerDelegate!
    
}

extension DemoManager: DashboardManagerDelegate {
    
}
