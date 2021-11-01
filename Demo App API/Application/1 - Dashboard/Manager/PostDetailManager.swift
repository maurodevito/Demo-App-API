//
//  PostDetailManager.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import Foundation

class PostDetailManager: BaseManager {
    weak var viewControllerDelegate: PostDetailControllerDelegate!
}

extension PostDetailManager: PostDetailManagerDelegate {
}
