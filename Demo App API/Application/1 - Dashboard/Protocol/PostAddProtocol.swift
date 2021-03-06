//
//  PostAddProtocol.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import Foundation

protocol PostAddControllerDelegate: BaseControllerDelegate {
    func postAdded(post: PostUIModel)
    func showError(error: Error)
}

protocol PostAddManagerDelegate: class {
    func addPost(userId: UInt, title: String, body: String)
}
