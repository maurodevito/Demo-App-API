//
//  PostAddManager.swift
//  Demo App API
//
//  Created by Mauro De Vito on 02/09/2021.
//

import Foundation

class PostAddManager: BaseManager {
    weak var viewControllerDelegate: PostAddControllerDelegate!
}

extension PostAddManager: PostAddManagerDelegate {
    func addPost(userId: UInt, title: String, body: String) {
        let requestModel: PostRequestModel = PostRequestModel(title: title,
                                                              body: body,
                                                              userId: userId)
        DashboardService.addNewPost(requestModel)
            .onSuccess(callback: { idResponse in
                let postResponseModel = PostResponseModel(id: idResponse,
                                                          title: title,
                                                          body: body,
                                                          userId: userId)
                let postUIModel = PostUIModel(postRespModel: postResponseModel)
                self.viewControllerDelegate.postAdded(post: postUIModel)
            })
            .onFailure { (error) in
                
            }
        
    }
    
    
}
