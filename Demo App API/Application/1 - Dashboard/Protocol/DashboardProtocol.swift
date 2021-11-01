//
//  DashboardProtocol.swift
//  Demo App API
//
//  Created by Mauro De Vito on 01/09/2021.
//

import Foundation

protocol DashboardControllerDelegate: BaseControllerDelegate {
    func setModel(posts: [PostUIModel])
}

protocol DashboardManagerDelegate: class {
    func viewDidLoad()
}
